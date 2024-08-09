import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = ThemeData();
  void changetheme(ThemeData themeData)
  {
    this.themeData = themeData;
    notifyListeners();
  }
}