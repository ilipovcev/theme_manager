import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Color getRandomColor() {
  final random = Random();
  final r = random.nextInt(256);
  final g = random.nextInt(256);
  final b = random.nextInt(256);
  return Color.fromRGBO(r, g, b, 1.0);
}

/// Initialize the theme storage.
/// Put it in the `main` function before running the app.
Future<void> initThemeStorage({Directory? storageDirectory}) async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : storageDirectory ?? await getApplicationDocumentsDirectory(),
  );
}
