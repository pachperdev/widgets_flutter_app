import 'package:flutter/material.dart';

List<Color> colorList = <Color>[
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.amber,
  Colors.lime,
  Colors.indigo,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
  Colors.black,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  })  : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      );
}
