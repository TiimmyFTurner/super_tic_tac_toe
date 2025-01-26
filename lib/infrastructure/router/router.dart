import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_tic_tac_toe/infrastructure/router/router_consts.dart';
import 'package:super_tic_tac_toe/presentation/screens/main_menu.dart';
import 'package:super_tic_tac_toe/presentation/screens/play_3x3_bot_screen.dart';
import 'package:super_tic_tac_toe/presentation/screens/play_3x3_no_tie_bot_screen.dart';
import 'package:super_tic_tac_toe/presentation/screens/play_3x3_no_tie_pvp_screen.dart';
import 'package:super_tic_tac_toe/presentation/screens/play_3x3_pvp_screen.dart';
import 'package:super_tic_tac_toe/presentation/screens/settings_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.homeRoutePath,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.homeRoutePath,
        builder: (context, state) => const MainMenu(),
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: Routes.play3x3PvP,
        builder: (context, state) => const Play3x3PvPScreen(),
      ),
      GoRoute(
        path: Routes.play3x3bot,
        builder: (context, state) => const Play3x3BotScreen(),
      ),
      GoRoute(
        path: Routes.play3x3NoTiePvP,
        builder: (context, state) => const Play3x3NoTiePvPScreen(),
      ),
      GoRoute(
          path: Routes.play3x3NoTieBot,
          builder: (context, state) => const Play3x3NoTieBotScreen())
    ],
  );

  static GoRouter get router => _router;
}
