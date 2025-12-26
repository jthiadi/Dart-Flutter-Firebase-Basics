import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ModeratorService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Set a user as moderator (only callable by existing moderators)
  Future<void> setUserAsModerator(String userId, bool isModerator) async {
    try {
      // Check if current user is a moderator
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception('User not authenticated');
      }

      final idToken = await currentUser.getIdTokenResult();
      final isCurrentUserModerator = idToken.claims?['isModerator'] ?? false;

      if (!isCurrentUserModerator) {
        throw Exception('Only moderators can set other users as moderators');
      }

      // Update the user's moderator status
      await _firestore
          .collection('apps')
          .doc('group-chat')
          .collection('users')
          .doc(userId)
          .update({'isModerator': isModerator});

      debugPrint('User $userId moderator status set to $isModerator');
    } catch (e) {
      debugPrint('Error setting moderator status: $e');
      rethrow;
    }
  }

  /// Check if current user is a moderator
  Future<bool> isCurrentUserModerator() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) return false;

      final idToken = await currentUser.getIdTokenResult(true); // Force refresh
      return idToken.claims?['isModerator'] ?? false;
    } catch (e) {
      debugPrint('Error checking moderator status: $e');
      return false;
    }
  }

  /// Delete a message (only for moderators)
  Future<void> deleteMessage(String messageId, String messageAuthorId) async {
    try {
      final isModerator = await isCurrentUserModerator();
      if (!isModerator) {
        throw Exception('Only moderators can delete messages');
      }

      // Get the message first to have author info for notification
      final messageDoc = await _firestore
          .collection('apps')
          .doc('group-chat')
          .collection('messages')
          .doc(messageId)
          .get();

      if (!messageDoc.exists) {
        throw Exception('Message not found');
      }

      final messageData = messageDoc.data()!;

      // Delete the message
      await _firestore
          .collection('apps')
          .doc('group-chat')
          .collection('messages')
          .doc(messageId)
          .delete();

      // Send notification to the message author
      await _sendDeletionNotification(messageId, messageAuthorId, messageData);

      debugPrint('Message $messageId deleted successfully');
    } catch (e) {
      debugPrint('Error deleting message: $e');
      rethrow;
    }
  }

  /// Send push notification to user whose message was deleted
  Future<void> _sendDeletionNotification(
      String messageId,
      String authorId,
      Map<String, dynamic> messageData
      ) async {
    try {
      // Create a notification document that will trigger a cloud function
      await _firestore
          .collection('apps')
          .doc('group-chat')
          .collection('notifications')
          .add({
        'type': 'message_deleted',
        'targetUserId': authorId,
        'messageId': messageId,
        'deletedAt': FieldValue.serverTimestamp(),
        'deletedBy': _auth.currentUser?.uid,
        'originalMessageText': messageData['text'] ?? '',
        'processed': false,
      });

      debugPrint('Deletion notification queued for user $authorId');
    } catch (e) {
      debugPrint('Error sending deletion notification: $e');
    }
  }
}