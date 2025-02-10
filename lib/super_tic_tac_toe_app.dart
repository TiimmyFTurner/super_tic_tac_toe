import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_tic_tac_toe/applications/state_management/setting_provider.dart';
import 'package:super_tic_tac_toe/infrastructure/router/router.dart';
import 'package:super_tic_tac_toe/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuperTicTacToeApp extends ConsumerWidget {
  const SuperTicTacToeApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context, ref) {
    Locale locale = ref.watch(localeSettingProvider);
    String? font = locale == L10n.fa ? 'Koodak' : null;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'Super Tic-Tac-Toe',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
          useMaterial3: true,
          fontFamily: font),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.tealAccent, brightness: Brightness.dark),
          useMaterial3: true,
          fontFamily: font),
      themeMode: ref.watch(themeModeSettingProvider),
      supportedLocales: L10n.all,
      locale: locale != L10n.system ? locale : null,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
