import 'package:flutter/material.dart';
import 'package:istreamo/config/themes/palette.dart';

class CustomTheme {
  static ThemeData defaultTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Palette.primary,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Palette.primary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Palette.primary,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Palette.primary,
        unselectedItemColor: Palette.niceBlack,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
