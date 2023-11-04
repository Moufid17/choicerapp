import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  String customTheme = 'light';

  void switchTheme(bool isLight) {
    customTheme = isLight ? 'light' : 'dark';
    notifyListeners(); // Informer les écouteurs du changement
  }
}