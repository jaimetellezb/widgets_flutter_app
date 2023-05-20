import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_flutter_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

/// listado de colores inmutables
final colorListProvider = Provider((ref) => colors);

final selectedColorProvider = StateProvider<int>((ref) => 5);

// Provider de un objeto
// el primer valor es la clase que va controlar el estado (ThemeNotifier)
// y el segundo es el estado (AppTheme)
// final themeNotifierProvider =
//     StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// /// esta clase va mantener o controlar el estado de AppTheme
// class ThemeNotifier extends StateNotifier<AppTheme> {
//   // esta línea crea una instancia de AppTheme
//   // esto es el STATE
//   ThemeNotifier() : super(AppTheme());

//   void toggleIsDarkMode() {
//     state = state.copyWith(isDarkMode: !state.isDarkMode);
//   }

//   void changeColorIndex(int colorIndex) {
//     state = state.copyWith(selectedColor: colorIndex);
//   }
// }

// opción con Notifier recomendada
final themeNotifierProvider =
    NotifierProvider<ThemeNotifier, AppTheme>(ThemeNotifier.new);

class ThemeNotifier extends Notifier<AppTheme> {
  @override
  AppTheme build() {
    return AppTheme();
  }

  void toggleIsDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
