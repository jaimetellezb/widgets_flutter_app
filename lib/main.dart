import 'package:flutter/material.dart';
import 'package:widgets_flutter_app/config/router/app_router.dart';
import 'package:widgets_flutter_app/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      // propiedad para quitar marca de debug en el celular al desarrollar
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme(selectedColor: 5).getTheme(),
    );
  }
}
