import 'package:flutter/material.dart';
import 'package:widgets_flutter_app/config/theme/app_theme.dart';
import 'package:widgets_flutter_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_flutter_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_flutter_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // propiedad para quitar marca de debug en el celular al desarrollar
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme(selectedColor: 5).getTheme(),
      home: const HomeScreen(),
      routes: {
        '/buttons': (context) => const ButtonsScreen(),
        'cards': (context) => const CardsScreen()
      },
    );
  }
}
