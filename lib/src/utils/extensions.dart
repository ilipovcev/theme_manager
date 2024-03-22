import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/src/controller/theme_bloc.dart';

extension ContextThemeExtension on BuildContext {
  /// Update theme color scheme with color seed.
  /// If colorSeed is null, the random color will be used.
  void changeThemeColor({Color? colorSeed}) {
    try {
      read<ThemeBloc>().add(ThemeEventChangeColorSeed(colorSeed: colorSeed));
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        debugPrintStack(stackTrace: s);
      }
    }
  }

  /// Switch theme mode
  void switchThemeMode(ThemeMode themeMode) {
    try {
      read<ThemeBloc>().add(ThemeEventChangeThemeMode(themeMode: themeMode));
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        debugPrintStack(stackTrace: s);
      }
    }
  }
}
