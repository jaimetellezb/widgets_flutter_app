import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

const colors = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.pink,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.deepOrange,
  Colors.pinkAccent,
  Colors.yellow,
  Colors.amber,
  Colors.indigo,
  Colors.lime,
  Colors.cyan,
  Colors.brown,
  Colors.cyan
];

@riverpod
class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colors.length,
            'Selected color must be less or equal than ${colors.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colors[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
      );

  // el copyWith se encarga de crear una copia de la instancia de una clase
  // para tener un nuevo estado
  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode,
  }) =>
      AppTheme(
          selectedColor: selectedColor ?? this.selectedColor,
          isDarkMode: isDarkMode ?? this.isDarkMode);
}
