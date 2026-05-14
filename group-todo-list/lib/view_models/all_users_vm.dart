import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/repositories/user_repo.dart';

class AllUsersViewModel with ChangeNotifier {
  final UserRepository _userRepository;

  List<User> _users = [];
  List<User> get users => _users;
  StreamSubscription<List<User>>? _usersSubscription;

  AllUsersViewModel({UserRepository? userRepository})
      : _userRepository = userRepository ?? UserRepository() {
    _usersSubscription = _userRepository.streamUsers().listen((usersData) {
      _users = usersData;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _usersSubscription?.cancel();
    super.dispose();
  }

  Future<void> addUser(User newUser) async {
    await _userRepository.addUser(newUser);
  }

  //tambah buat users
  Future<void> delUser(String userId) async {
    //try {
      // buat ambil semua users kecuali yg bkl didelet
      final otherUsers = _users.where((user) => user.id != userId).toList();

      // ini buat ngecall repo items yg atur orphan items
      await _userRepository.delUser(userId, otherUsers);

      // update local state
      _users.removeWhere((user) => user.id == userId);
      notifyListeners();
    } //catch (e) {
      // pas gaada user lagi n mau diapus
      //rethrow;
    //}
  //}
}
