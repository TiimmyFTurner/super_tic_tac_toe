import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '3x3_board_provider.g.dart';

@riverpod
class Board extends _$Board {
  @override
  List<List<String>> build() {
    List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
    return board;
  }
}

@riverpod
class CurrentPlayer extends _$CurrentPlayer {
  @override
  String build() {
    return 'X';
  }

  void change() {
    state = state == 'X' ? 'O' : 'X';
  }
}

@riverpod
String winnerCheck(Ref ref) {
  List board = ref.read(boardProvider);
  String currentPlayer = ref.read(currentPlayerProvider);
  // Check rows
  for (int i = 0; i < 3; i++) {
    if (board[i][0] == currentPlayer &&
        board[i][1] == currentPlayer &&
        board[i][2] == currentPlayer) {
      return currentPlayer;
    }
  }

  // Check columns
  for (int i = 0; i < 3; i++) {
    if (board[0][i] == currentPlayer &&
        board[1][i] == currentPlayer &&
        board[2][i] == currentPlayer) {
      return currentPlayer;
    }
  }

  // Check diagonals
  if ((board[0][0] == currentPlayer &&
          board[1][1] == currentPlayer &&
          board[2][2] == currentPlayer) ||
      (board[0][2] == currentPlayer &&
          board[1][1] == currentPlayer &&
          board[2][0] == currentPlayer)) {
    return currentPlayer;
  }

  // Check for a tie
  if (board.every((row) => row.every((cell) => cell != ''))) {
    return 'Tie';
  }

  return '';
}

@riverpod
class ScoreBoard extends _$ScoreBoard {
  @override
  List build() {
    return [0, 0];
  }

  void scored(String player) {
    if (player == 'X') {
      state = [state[0] + 1, state[1]];
    } else {
      state = [state[0], state[1] + 1];
    }
  }
}
