import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_tic_tac_toe/applications/state_management/shared_preferences_provider.dart';
import 'package:super_tic_tac_toe/super_tic_tac_toe_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  return runApp(ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const SuperTicTacToeApp()));
}