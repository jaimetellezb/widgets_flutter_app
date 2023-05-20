import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_flutter_app/config/router/app_router.dart';
import 'package:widgets_flutter_app/presentation/providers/theme_provider.dart';

void main() {
  // configuración para utilizar Riverpod
  // con esto Riverpod sabe dónde buscar los providers que se creen
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final int selectedColor = ref.watch(selectedColorProvider);
    // final bool isDarkMode = ref.watch(isDarkModeProvider);
    final appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      // propiedad para quitar marca de debug en el celular al desarrollar
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}
