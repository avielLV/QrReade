import 'package:flutter/material.dart';

class ThemeApp {
  static final themeData = ThemeData.light().copyWith(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          // selectedLabelStyle: TextStyle(color: Colors.red),
          // selectedIconTheme: IconThemeData(color: Colors.red),
          selectedItemColor: Colors.red),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.red,
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.red));
}
