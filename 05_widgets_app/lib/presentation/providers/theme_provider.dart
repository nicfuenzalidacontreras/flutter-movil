import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);
final colorListProvider = Provider((ref) => colorList);
final selectedColorProvider = StateProvider((ref) => 0);
final themeNotifierProvider = StateNotifierProvider<ThemeNotifer, AppTheme>(
  (ref) => ThemeNotifer(),
);

class ThemeNotifer extends StateNotifier<AppTheme> {
  ThemeNotifer() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
