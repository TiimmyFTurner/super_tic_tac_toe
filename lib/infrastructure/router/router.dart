import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_tic_tac_toe/infrastructure/router/router_consts.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.homeRoutePath,
    routes: <RouteBase>[],
  );

  static GoRouter get router => _router;
}
