import 'package:flutter/material.dart';

class MenuProviderChatsPage extends ChangeNotifier {
  bool _isOpen = false;

  bool get isOpen => _isOpen;

  void update() {
    _isOpen = !_isOpen;
    notifyListeners();
  }
}

class MenuProviderUpdatesPage extends ChangeNotifier {
  bool _isOpen = false;

  bool get isOpen => _isOpen;

  void update() {
    _isOpen = !_isOpen;
    notifyListeners();
  }
}

class MenuProviderCommunitiesPage extends ChangeNotifier {
  bool _isOpen = false;

  bool get isOpen => _isOpen;

  void update() {
    _isOpen = !_isOpen;
    notifyListeners();
  }
}

class MenuProviderCallsPage extends ChangeNotifier {
  bool _isOpen = false;

  bool get isOpen => _isOpen;

  void update() {
    _isOpen = !_isOpen;
    notifyListeners();
  }
}
