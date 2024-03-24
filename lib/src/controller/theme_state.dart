part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({
    required this.themeMode,
    required this.colorSeed,
    this.textTheme,
  });
  factory ThemeState.fromMap(
    Map<String, dynamic> map,
    TextTheme? textTheme,
  ) =>
      ThemeState(
        themeMode: ThemeMode.values.byName(map['themeMode'] as String),
        colorSeed: Color(map['colorSeed'] as int),
        textTheme: textTheme,
      );

  final TextTheme? textTheme;
  final ThemeMode themeMode;
  final Color colorSeed;

  ThemeData get lightTheme => ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: colorSeed),
        textTheme: textTheme,
      );

  ThemeData get darkTheme => ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorSeed,
          brightness: Brightness.dark,
        ),
        textTheme: textTheme,
      );

  @override
  List<Object?> get props => [
        themeMode,
        colorSeed,
        textTheme,
      ];

  ThemeState copyWith({
    ThemeMode? themeMode,
    Color? colorSeed,
  }) =>
      ThemeState(
        themeMode: themeMode ?? this.themeMode,
        colorSeed: colorSeed ?? this.colorSeed,
        textTheme: textTheme,
      );

  Map<String, dynamic> toMap() => {
        'themeMode': themeMode.name,
        'colorSeed': colorSeed.value,
      };
}
