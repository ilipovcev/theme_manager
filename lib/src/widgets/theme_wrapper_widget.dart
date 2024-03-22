import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/src/controller/theme_bloc.dart';
import 'package:theme_manager/src/src.dart';

/// Wrap your app with this widget to use the theme bloc.
class ThemeWrapperWidget extends StatefulWidget {
  const ThemeWrapperWidget({
    super.key,
    required this.builder,
  });

  final Widget Function(
    BuildContext context,
    ThemeState state,
  ) builder;

  @override
  State<ThemeWrapperWidget> createState() => _ThemeWrapperWidgetState();
}

class _ThemeWrapperWidgetState extends State<ThemeWrapperWidget> {
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
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: widget.builder,
        ),
      );
}
