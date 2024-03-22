import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/src/controller/theme_bloc.dart';

/// Wrap your app with this widget to use the theme bloc.
class ThemeWrapperWidget extends StatelessWidget {
  const ThemeWrapperWidget({
    super.key,
    required this.builder,
  });

  final Widget Function(
    BuildContext context,
    ThemeState state,
  ) builder;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: builder,
        ),
      );
}
