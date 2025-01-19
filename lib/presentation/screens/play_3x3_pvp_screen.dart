import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_tic_tac_toe/applications/state_management/3x3_board_provider.dart';

class Play3x3PvPScreen extends ConsumerStatefulWidget {
  const Play3x3PvPScreen({super.key});

  @override
  Play3x3PvPScreenState createState() => Play3x3PvPScreenState();
}

class Play3x3PvPScreenState extends ConsumerState<Play3x3PvPScreen> {
  @override
  Widget build(BuildContext context) {
    List<List<String>> board = ref.watch(boardProvider);
    String currentPlayer = ref.watch(currentPlayerProvider);
    String winner = ref.read(winnerCheckProvider);

    void onTap(int row, int col) {
      if (board[row][col] == '' && winner == '') {
        setState(() {
          board[row][col] = currentPlayer;
          winner = ref.read(winnerCheckProvider);
          if (winner == '') {
            ref.read(currentPlayerProvider.notifier).change();
          } else {
            if (winner != 'tie') {
              ref.read(scoreBoardProvider.notifier).scored(winner);
            }
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title:
                      Text(winner == 'Tie' ? 'It\'s a Tie!' : '$winner Wins!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          ref.invalidate(boardProvider);
                        });
                      },
                      child: const Text('Play Again'),
                    ),
                  ],
                );
              },
            );
          }
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("3x3 PvP"),
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(boardProvider);
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
              Text("Players Turn",
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
