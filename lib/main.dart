import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_tic_tac_toe/super_tic_tac_toe_app.dart';

void main() {
  runApp(ProviderScope(child: const SuperTicTacToeApp()));
}

