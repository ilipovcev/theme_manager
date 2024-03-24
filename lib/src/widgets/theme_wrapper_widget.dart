import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/src/controller/theme_bloc.dart';
import 'package:theme_manager/src/src.dart';

typedef ThemeBuilder = Widget Function(BuildContext context, ThemeState state);

/// Wrap your app with this widget to use the theme bloc.
class ThemeWrapperWidget extends StatelessWidget {
  const ThemeWrapperWidget({
    super.key,
    required this.builder,
    this.textTheme,
    this.changeThemeBrightnessBySystemValue = false,
  });

  final TextTheme? textTheme;
  final ThemeBuilder builder;
  final bool changeThemeBrightnessBySystemValue;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ThemeBloc(
          textTheme: textTheme,
        ),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) => changeThemeBrightnessBySystemValue ? _ThemedWidget(builder: builder, state: state) : builder(context, state),
        ),
      );
}

class _ThemedWidget extends StatefulWidget {
  const _ThemedWidget({
    required this.builder,
    required this.state,
  });

  final Widget Function(
    BuildContext context,
    ThemeState state,
  ) builder;

  final ThemeState state;

  @override
  State<_ThemedWidget> createState() => _ThemedWidgetState();
}

class _ThemedWidgetState extends State<_ThemedWidget> {
  @override
  void initState() {
    super.initState();

    final dispatcher = SchedulerBinding.instance.platformDispatcher;

    // This callback is called every time the brightness changes.
    dispatcher.onPlatformBrightnessChanged = () {
      final brightness = dispatcher.platformBrightness;

      context.switchThemeMode(
        brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
      );
    };
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, widget.state);
}
