part of 'theme_bloc.dart';

sealed class ThemeEvent {
  const ThemeEvent();
}

class ThemeEventChangeThemeMode extends ThemeEvent {
  const ThemeEventChangeThemeMode({
    required this.themeMode,
  });

  final ThemeMode themeMode;
}

class ThemeEventChangeColorSeed extends ThemeEvent {
  const ThemeEventChangeColorSeed({
    this.colorSeed,
  });

  final Color? colorSeed;
}
