import 'package:flutter/material.dart';
import 'package:super_tic_tac_toe/infrastructure/router/router.dart';

class SuperTicTacToeApp extends StatelessWidget {
  const SuperTicTacToeApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
    );
  }
}