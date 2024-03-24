import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:theme_manager/src/utils/utils_functions.dart';

part 'theme_event.dart';
part 'theme_state.dart';

/// ThemeBloc
///
/// The `ThemeBloc` is a component designed to manage the theme mode and color scheme
/// of a Flutter application. It extends the `HydratedBloc` package, allowing it to
/// persist its state across app restarts.
///
/// Features:
/// - Theme Mode Management: The bloc enables switching between light, dark, and
///   system-defined theme modes.
/// - Color Scheme Customization: It provides functionality to change the color seed
///   used in generating the app's color scheme.
///
/// Usage:
/// 1. Initialization: Create an instance of `ThemeBloc` to start managing the theme
///    state within your Flutter application.
///
///    ```dart
///    final themeBloc = ThemeBloc();
///    ```
///
/// 2. Listening to State Changes: Listen to state changes in your UI widgets and
///    update them accordingly.
///
///    ```dart
///    BlocBuilder<ThemeBloc, ThemeState>(
///      builder: (context, state) {
///        return MaterialApp(
///          themeMode: state.themeMode,
///          theme: state.lightTheme,
///          darkTheme: state.darkTheme,
///          // Other MaterialApp properties...
///        );
///      },
///    );
///    ```
///
/// 3. Dispatching Events: Dispatch events to the bloc to trigger state changes.
///
///    ```dart
///    themeBloc.add(ThemeEventChangeThemeMode(themeMode: ThemeMode.dark));
///    themeBloc.add(const ThemeEventChangeColorSeed());
///    ```
///
/// State Management:
/// - ThemeState: Represents the current state of the theme, including the theme
///   mode and color seed.
/// - Equatable: Implements value equality for efficient state comparison.
/// - toJson / fromJson: Allows state to be serialized and deserialized for persistence
///   using `HydratedBloc`.
///
/// Events:
/// - ThemeEvent: Base class for theme-related events.
/// - ThemeEventChangeThemeMode: Event triggered when the theme mode is changed.
/// - ThemeEventChangeColorSeed: Event triggered when the color seed is changed.
///
class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc({
    this.textTheme,
  }) : super(
          ThemeState(
            themeMode: ThemeMode.system,
            colorSeed: getRandomColor(),
            textTheme: textTheme,
          ),
        ) {
    on<ThemeEventChangeThemeMode>(
      (event, emit) => emit(
        state.copyWith(themeMode: event.themeMode),
      ),
    );

    on<ThemeEventChangeColorSeed>(
      (event, emit) => emit(
        state.copyWith(colorSeed: event.colorSeed ?? getRandomColor()),
      ),
    );
  }

  final TextTheme? textTheme;

  @override
  ThemeState? fromJson(Map<String, dynamic> json) => ThemeState.fromMap(
        json,
        textTheme,
      );

  @override
  Map<String, dynamic>? toJson(ThemeState state) => state.toMap();
}
