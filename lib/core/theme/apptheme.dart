import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData lightTheme = ThemeData(
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(selectedItemColor: Colors.black),
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold))
      // Customize more light theme properties here
      );

  final ThemeData darkTheme = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.withOpacity(0.6)),
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold))

      // Customize more dark theme properties here
      );
}
