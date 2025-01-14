import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_tic_tac_toe/infrastructure/router/router_consts.dart';
import 'package:super_tic_tac_toe/presentation/screens/play_3x3_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.homeRoutePath,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.homeRoutePath,
        builder: (context, state) => const Play3x3Screen(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
