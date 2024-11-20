import 'package:boilerplate/screenmode/lightmode.dart';
import 'package:boilerplate/screenmode/nightmode.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = light_mode;

  // Constructor
  ThemeProvider() {
    // Do nothing here; initialize is called explicitly.
  }

  // Getter for the current theme
  ThemeData get currentTheme => _currentTheme;

  // Getter to check if the current theme is dark mode
  bool get isDarkMode => _currentTheme == dark_Mode;

  // Toggles between light mode and dark mode
  void toggleTheme() {
    _currentTheme = isDarkMode ? light_mode : dark_Mode;
    notifyListeners();
    _saveThemePreference();
  }

  // Saves the current theme preference in SharedPreferences
  Future<void> _saveThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  // Initializes the theme (call this explicitly in main)
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final savedIsDarkMode = prefs.getBool('isDarkMode') ?? false;
    _currentTheme = savedIsDarkMode ? dark_Mode : light_mode;
  }
}
