import 'dart:math';

class TicTacToeBot {
  List<List<String>> _board;
  final String _botPlayer = 'O';

  TicTacToeBot(this._board);

  /// Finds the best move for the bot player.
  ///
  /// Returns a list containing the row and column of the best move.
  /// Returns null if no valid move is found.
  List<int>? findBestMove() {
    int bestScore = -1000;
    List<int>? bestMove;

    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (_board[row][col] == '') {
          _board[row][col] = _botPlayer;
          int score = minimax(false); // Evaluate the score of this move
          _board[row][col] = '';

          if (score > bestScore) {
            bestScore = score;
            bestMove = [row, col];
          }
        }
      }
    }

    return bestMove;
  }

  /// Minimax algorithm for evaluating the game state.
  ///
  /// `isMaximizing` determines whether the current player is maximizing
  /// (bot) or minimizing (opponent).
  int minimax(bool isMaximizing) {
    if (checkWin('X')) return -10; // Opponent wins
    if (checkWin(_botPlayer)) return 10; // Bot wins
    if (isBoardFull()) return 0; // Draw

    if (isMaximizing) { // Bot's turn
      int bestScore = -1000;
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
          if (_board[row][col] == '') {
            _board[row][col] = _botPlayer;
            bestScore = max(bestScore, minimax(false));
            _board[row][col] = '';
          }
        }
      }
      return bestScore;
    } else { // Opponent's turn
      int bestScore = 1000;
      for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
          if (_board[row][col] == '') {
            _board[row][col] = 'X';
            bestScore = min(bestScore, minimax(true));
            _board[row][col] = '';
          }
        }
      }
      return bestScore;
    }
  }

  /// Checks if the given player has won the game.
  bool checkWin(String player) {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (_board[i][0] == player && _board[i][1] == player && _board[i][2] == player) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (_board[0][i] == player && _board[1][i] == player && _board[2][i] == player) {
        return true;
      }
    }

    // Check diagonals
    if ((_board[0][0] == player && _board[1][1] == player && _board[2][2] == player) ||
        (_board[0][2] == player && _board[1][1] == player && _board[2][0] == player)) {
      return true;
    }

    return false;
  }

  /// Checks if the board is full.
  bool isBoardFull() {
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (_board[row][col] == '') {
          return false;
        }
      }
    }
    return true;
  }
}