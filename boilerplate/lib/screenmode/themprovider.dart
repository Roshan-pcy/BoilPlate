import 'package:boilerplate/screenmode/lightmode.dart';
import 'package:boilerplate/screenmode/nightmode.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themedata = light_mode;

  ThemeProvider() {
    _loadThemePreference(); // Load theme preference when initializing the provider
  }

  // Getter for the current theme
  ThemeData get getTheme => _themedata;

  // Setter for the theme, with notification to listeners
  void set setTheme(ThemeData themeData) {
    _themedata = themeData;
    notifyListeners();
  }

  // Getter for dark mode state
  bool get isDarkMode => _themedata == dark_Mode;

  // Toggle between light and dark mode
  void togle_Theme() {
    if (_themedata == dark_Mode) {
      setTheme = light_mode;
    } else {
      setTheme = dark_Mode;
    }
    _saveThemePreference(
        isDarkMode); // Save the theme preference after toggling
  }

  // Save theme preference in SharedPreferences
  Future<void> _saveThemePreference(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  // Load the saved theme preference from SharedPreferences
  Future<void> _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    if (isDarkMode) {
      setTheme = dark_Mode;
    } else {
      setTheme = light_mode;
    }
  }
}
