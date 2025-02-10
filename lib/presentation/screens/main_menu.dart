import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_tic_tac_toe/infrastructure/router/router_consts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainMenu extends ConsumerStatefulWidget {
  const MainMenu({super.key});

  @override
  ConsumerState createState() => _MainMenuState();
}

class _MainMenuState extends ConsumerState<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/theme/menu_bg.jpg"), fit: BoxFit.cover),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {
                  context.push(Routes.settings);
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 33,
                ),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: FilledButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(18),
                                bottom: Radius.circular(4)),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.play3x3PvP,
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          context.push(Routes.play3x3PvP);
                        }),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: FilledButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(4),
                                bottom: Radius.circular(4)),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.play3x3bot,
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          context.push(Routes.play3x3bot);
                        }),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: FilledButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(4),
                                bottom: Radius.circular(4)),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.play3x3noTiePvP,
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          context.push(Routes.play3x3NoTiePvP);
                        }),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: FilledButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(4),
                                bottom: Radius.circular(18)),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.play3x3noTieBot,
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          context.push(Routes.play3x3NoTieBot);
                        }),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ));
  }
}
