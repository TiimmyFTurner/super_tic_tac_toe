import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_tic_tac_toe/applications/state_management/shared_preferences_provider.dart';


part 'setting_provider.g.dart';

@riverpod
class ThemeModeSetting extends _$ThemeModeSetting {
  dynamic _prefs;

  @override
  ThemeMode build() {
    _prefs = ref.watch(sharedPreferencesProvider);
    final themeMode = _prefs.getInt('themeMode');
    return switch (themeMode) {
      1 => ThemeMode.light,
      2 => ThemeMode.dark,
      _ => ThemeMode.system
    };
  }

  void changeTheme(ThemeMode themeMode) {
    state = themeMode;
    switch (themeMode) {
      case ThemeMode.light:
        _prefs.setInt('themeMode', 1);
      case ThemeMode.dark:
        _prefs.setInt('themeMode', 2);
      default:
        _prefs.remove('themeMode');
    }
  }
}
