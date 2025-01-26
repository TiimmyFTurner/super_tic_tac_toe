import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_tic_tac_toe/applications/state_management/3x3_board_provider.dart';
import 'package:super_tic_tac_toe/presentation/helpers/tic_tac_toe_bot.dart';
import 'dart:async';

class Play3x3BotScreen extends ConsumerStatefulWidget {
  const Play3x3BotScreen({super.key});

  @override
  Play3x3BotScreenState createState() => Play3x3BotScreenState();
}

class Play3x3BotScreenState extends ConsumerState<Play3x3BotScreen> {
  @override
  Widget build(BuildContext context) {
    List<List<String>> board = ref.watch(boardProvider);
    String currentPlayer = ref.watch(currentPlayerProvider);
    String winner = ref.read(winnerCheckProvider(currentPlayer));
    TicTacToeBot bot = TicTacToeBot(board);

    void onTap(int row, int col) {
      if (board[row][col] == '' && winner == '') {
        board[row][col] = currentPlayer;

        winner = ref.read(winnerCheckProvider(currentPlayer));
        if (winner == '') {
          List<int>? botMove = bot.findBestMove();
          if (botMove != null) {
            board[botMove[0]][botMove[1]] = 'O';
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
                      ref.invalidate(currentPlayerProvider);
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
        title: Text("3x3 Vs Bot"),
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(boardProvider);
                ref.invalidate(currentPlayerProvider);
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.,
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
                              child: Image.asset('assets/theme/x1.png')),
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
                              child: Image.asset('assets/theme/o1.png')),
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
                        onTap: () => onTap(i, j),
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
                                ? Image.asset('assets/theme/o1.png')
                                : board[i][j] == 'X'
                                    ? Image.asset('assets/theme/x1.png')
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
