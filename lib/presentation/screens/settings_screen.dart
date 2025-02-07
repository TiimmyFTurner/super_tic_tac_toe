// Flutter imports:

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_tic_tac_toe/applications/state_management/game_config_provider.dart';
import 'package:super_tic_tac_toe/applications/state_management/setting_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    String themeName = ref.watch(themeModeSettingProvider).name;
    String? playerO = ref.watch(playerPicProvider)['O'];
    String? playerX = ref.watch(playerPicProvider)['X'];

    final picsList = List<String>.generate(3, (i) {
      return (i + 1).toString();
    });

    return Scaffold(
      appBar: AppBar(title: const Text("تنظیمات")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Divider(),
          ListTile(
              title: const Text("انتخاب تم"),
              subtitle: Text(
                themeName == "light"
                    ? "روشن"
                    : themeName == 'dark'
                        ? 'تاریک'
                        : 'پیش فرض سیستم',
              ),
              onTap: () {
                ThemeMode themeMode = ref.read(themeModeSettingProvider);
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) =>
                      StatefulBuilder(builder: (context, setState) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      title: const Text("انتخاب تم"),
                      content:
                          Column(mainAxisSize: MainAxisSize.min, children: [
                        RadioListTile<ThemeMode>(
                          title: const Text("روشن"),
                          value: ThemeMode.light,
                          groupValue: themeMode,
                          onChanged: (value) {
                            setState(() {
                              themeMode = value!;
                            });
                          },
                        ),
                        RadioListTile<ThemeMode>(
                          title: const Text("تاریک"),
                          value: ThemeMode.dark,
                          groupValue: themeMode,
                          onChanged: (value) {
                            setState(() {
                              themeMode = value!;
                            });
                          },
                        ),
                        RadioListTile<ThemeMode>(
                          title: const Text("پیش فرض سیستم"),
                          value: ThemeMode.system,
                          groupValue: themeMode,
                          onChanged: (value) {
                            setState(() {
                              themeMode = value!;
                            });
                          },
                        ),
                      ]),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => context.pop(),
                          child: const Text("انصراف"),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pop();
                            ref
                                .read(themeModeSettingProvider.notifier)
                                .changeTheme(themeMode);
                          },
                          child: const Text("تایید"),
                        ),
                      ],
                    );
                  }),
                );
              }),
          // SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 1,
                  child: DropdownButtonFormField<String>(
                    iconSize: 45,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Player X"),
                    value: playerX,
                    onChanged: (String? newValue) {
                      setState(() {
                        ref
                            .read(playerPicProvider.notifier)
                            .changePic('X', newValue!);
                      });
                    },
                    items: picsList.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                // fit: BoxFit.cover,
                                image: AssetImage("assets/theme/X$item.png"),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    selectedItemBuilder: (_) {
                      return picsList.map<Widget>((String item) {
                        return Container(
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: AssetImage("assets/theme/X$playerX.png"),
                            ),
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  flex: 1,
                  child: DropdownButtonFormField<String>(
                    iconSize: 45,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Player O"),
                    value: playerO,
                    onChanged: (String? newValue) {
                      setState(() {
                        ref
                            .read(playerPicProvider.notifier)
                            .changePic('O', newValue!);
                      });
                    },
                    items: picsList.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                // fit: BoxFit.cover,
                                image: AssetImage("assets/theme/O$item.png"),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    selectedItemBuilder: (_) {
                      return picsList.map<Widget>((String item) {
                        return Container(
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: AssetImage("assets/theme/O$playerO.png"),
                            ),
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 36),
                const Text("Super Tic-Tac-Toe   1.2.0",
                    style: TextStyle(color: Colors.grey)),
                const Text("Copyright © 2025 Timothy F. Turner",
                    style: TextStyle(color: Colors.grey)),
                InkWell(
                  onTap: _sendMail,
                  child: const Text("TiimmyFTurner@gmail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey)),
                ),
                InkWell(
                  onTap: _openTelegram,
                  child: const Text("T.me/TiimmyFTurner",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendMail() async {
    final Uri url =
        Uri.parse('mailto:TiimmyFTurner@gmail.com?subject=MafiaApp');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _openTelegram() async {
    final Uri url = Uri.parse('https://T.me/TiimmyFTurner');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
