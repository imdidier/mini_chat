import 'package:flutter/material.dart';

const Color _customColor = Colors.greenAccent;
const List<Color> _colorThemes = [
  _customColor,
  Colors.pinkAccent,
  Colors.blue,
  Colors.red,
  Colors.grey,
  Colors.purpleAccent,
  Colors.amberAccent,
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      : assert(
          selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
          'Colores entre 0 y ${_colorThemes.length - 1}',
        );
  ThemeData themeData() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
