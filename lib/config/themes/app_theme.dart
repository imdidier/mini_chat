import 'package:flutter/material.dart';

const Color _customColor = Colors.greenAccent;
const List<Color> _colorThemes = [
  _customColor,
  Colors.pink,
  Colors.blue,
  Colors.red,
  Colors.grey,
  Colors.purple,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      : assert(
          selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
          'Colores entre 0 y ${_colorThemes.length - 1}',
        );
  ThemeData themeData(bool isDarkMode) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    );
  }
}
