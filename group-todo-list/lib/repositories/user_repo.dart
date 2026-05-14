import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/repositories/todo_item_repo.dart';
import 'dart:math';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final timeout = const Duration(seconds: 10);
  final TodoItemRepository _todoItemRepo = TodoItemRepository(); // tambah

  Stream<List<User>> streamUsers() {
    return _db
        .collection('apps/group-todo-list/users')
        .orderBy('itemCount', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map(
              (doc) => User.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }

  Future<void> addUser(User user) async {
    Map<String, dynamic> userMap = user.toMap();
    // Remove 'id' because Firestore automatically generates a unique document ID for each new document added to the collection.
    userMap.remove('id');
    await _db
        .collection('apps/group-todo-list/users')
        .add(userMap)
        .timeout(timeout); // Add timeout to handle network issues
  }

  // tambah ini
  Future<void> delUser(String userId, List<User> otherUsers) async {
    // ambil semua todo dari user yg mau diapus
    final itemsSnapshot = await _db
        .collection('apps/group-todo-list/users')
        .doc(userId)
        .collection('todo-items')
        .get();

    if (otherUsers.isNotEmpty) {
      // stlh apus, random bagi ke masing2 anggota
      final random = Random();
      for (final itemDoc in itemsSnapshot.docs) {
        final randomUser = otherUsers[random.nextInt(otherUsers.length)];
        await _todoItemRepo.reassignItem(
            itemDoc.id,
            userId,
            randomUser.id!
        );
      }
    } else {
      // klo gaada user, delet semua todo
      for (final itemDoc in itemsSnapshot.docs) {
        await _todoItemRepo.deleteItem(itemDoc.id, userId);
      }
    }

    // delete user document
    await _db
        .collection('apps/group-todo-list/users')
        .doc(userId)
        .delete();
  }
}
