part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({
    required this.themeMode,
    required this.colorSeed,
  });
  factory ThemeState.fromMap(Map<String, dynamic> map) => ThemeState(
        themeMode: ThemeMode.values.byName(map['themeMode'] as String),
        colorSeed: Color(map['colorSeed'] as int),
      );

  final ThemeMode themeMode;
  final Color colorSeed;

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorSeed,
      );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorSeed,
        brightness: Brightness.dark,
      );

  @override
  List<Object?> get props => [
        themeMode,
        colorSeed,
      ];

  ThemeState copyWith({
    ThemeMode? themeMode,
    Color? colorSeed,
  }) =>
      ThemeState(
        themeMode: themeMode ?? this.themeMode,
        colorSeed: colorSeed ?? this.colorSeed,
      );

  Map<String, dynamic> toMap() => {
        'themeMode': themeMode.name,
        'colorSeed': colorSeed.value,
      };
}
