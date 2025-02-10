import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/theme/dark_theme.dart';
import 'package:whatsapp_clone/theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode =
      PlatformDispatcher.instance.platformBrightness == Brightness.dark;
  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
