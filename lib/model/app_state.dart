import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String _name = '';
  String? _selectedUserName;

  String get name => _name;
  String? get selectedUserName => _selectedUserName;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setSelectedUserName(String? userName) {
    _selectedUserName = userName;
    notifyListeners();
  }

  bool isPalindrome(String text) {
    String reversedText = text.split('').reversed.join('');
    return text == reversedText;
  }
}
