import 'package:flutter/material.dart';

ThemeData light_mode = ThemeData(
    colorScheme: ColorScheme.light(
        surface: Colors.grey.shade300,
        primary: Colors.grey.shade500,
        secondary: Colors.grey.shade200,
        inversePrimary: Colors.grey.shade900));

extension ThemeExtras on BuildContext {
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
}
