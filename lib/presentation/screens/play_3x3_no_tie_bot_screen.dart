import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_tic_tac_toe/applications/state_management/3x3_board_provider.dart';
import 'package:super_tic_tac_toe/applications/state_management/game_config_provider.dart';
import 'package:super_tic_tac_toe/applications/state_management/no_tie_provider.dart';
import 'package:super_tic_tac_toe/infrastructure/router/router_consts.dart';
import 'package:super_tic_tac_toe/presentation/helpers/tic_tac_toe_bot.dart';

class Play3x3NoTieBotScreen extends ConsumerStatefulWidget {
  const Play3x3NoTieBotScreen({super.key});

  @override
  Play3x3NoTieBotScreenState createState() => Play3x3NoTieBotScreenState();
}

class Play3x3NoTieBotScreenState extends ConsumerState<Play3x3NoTieBotScreen> {
  @override
  Widget build(BuildContext context) {
    List<List<String>> board = ref.watch(boardProvider);
    String currentPlayer = ref.watch(currentPlayerProvider);
    String winner = ref.read(winnerCheckProvider(currentPlayer));
    TicTacToeBot bot = TicTacToeBot(board);
    List<Queue<List<int>>> playerMoves = ref.watch(playerMovesProvider);
    String? playerOImage = ref.watch(playerPicProvider)['O'];
    String? playerXImage = ref.watch(playerPicProvider)['X'];

    void onTap(int row, int col) {
      if (board[row][col] == '' && winner == '') {
        List removed =
            ref.read(playerMovesProvider.notifier).playerXMoved(row, col);
        if (removed.isNotEmpty) {
          board[removed[0]][removed[1]] = '';
        }

        board[row][col] = currentPlayer;

        winner = ref.read(winnerCheckProvider(currentPlayer));
        if (winner == '') {
          List<int>? botMove = bot.findBestMove();
          if (botMove != null) {
            board[botMove[0]][botMove[1]] = 'O';
            List removed = ref
                .read(playerMovesProvider.notifier)
                .playerOMoved(botMove[0], botMove[1]);
            if (removed.isNotEmpty) {
              board[removed[0]][removed[1]] = '';
            }
          }
          winner = ref.read(winnerCheckProvider('O'));
        }
        if (winner != '') {
          if (winner != 'Tie') {
            ref.read(scoreBoardProvider.notifier).scored(winner);
          }
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(winner == 'Tie' ? 'It\'s a Tie!' : '$winner Wins!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ref.invalidate(boardProvider);
                      ref.invalidate(playerMovesProvider);
                    },
                    child: const Text('Play Again'),
                  ),
                ],
              );
            },
          );
        }
      }
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("3x3 No Tie Vs Bot"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Reset Game?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'No',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.error),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              ref.invalidate(boardProvider);
                              ref.invalidate(currentPlayerProvider);
                              ref.invalidate(playerMovesProvider);
                            });
                          },
                          child: const Text('Reset'),
                        ),
                      ],
                    );
                  },
                );

              },
              icon: Icon(Icons.refresh)),
          IconButton(
            onPressed: () {
              context.push(Routes.settings).then((r) {
                setState(() {});
              });
            },
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 75),
          Column(
            children: [
              Text('Players',
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Player X (${ref.watch(scoreBoardProvider)[0]})",
                              style: Theme.of(context).textTheme.titleLarge),
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                  'assets/theme/X$playerXImage.png')),
                          Container(
                            width: 100,
                            height: 8,
                            color:
                                currentPlayer == 'X' ? Colors.lightGreen : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Player O (${ref.watch(scoreBoardProvider)[1]})",
                              style: Theme.of(context).textTheme.titleLarge),
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                  'assets/theme/O$playerOImage.png')),
                          Container(
                            width: 100,
                            height: 8,
                            color:
                                currentPlayer == 'O' ? Colors.lightGreen : null,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 100),
          Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int j = 0; j < 3; j++)
                      GestureDetector(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          onTap(i, j);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: 100,
                          height: 100,
                          // decoration: BoxDecoration(border: Border.all()),
                          child: Center(
                            child: board[i][j] == 'O'
                                ? Image.asset('assets/theme/O$playerOImage.png',
                                    opacity: AlwaysStoppedAnimation(
                                        playerMoves[1].length > 2 &&
                                                playerMoves[1].first[0] == i &&
                                                playerMoves[1].first[1] == j
                                            ? .65
                                            : 1))
                                : board[i][j] == 'X'
                                    ? Image.asset(
                                        'assets/theme/X$playerXImage.png',
                                        opacity: AlwaysStoppedAnimation(
                                            playerMoves[0].length > 2 &&
                                                    playerMoves[0].first[0] ==
                                                        i &&
                                                    playerMoves[0].first[1] == j
                                                ? .65
                                                : 1))
                                    : Container(),
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
