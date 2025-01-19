import 'dart:collection';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'no_tie_provider.g.dart';

@riverpod
class PlayerMoves extends _$PlayerMoves {
  @override
  List<Queue<List<int>>> build() {
    List<Queue<List<int>>> playerMoves = List.generate(2, (_) => Queue());
    return playerMoves;
  }

  List playerXMoved(i, j) {
    state[0].addLast([i, j]);
    Queue<List<int>> xMoves = state[0];
    List removedRole = [];
    if (xMoves.length > 3) {
      removedRole = xMoves.first;
      xMoves.removeFirst();
    }
    state = [xMoves, state[1]];
    return removedRole;
  }

  List playerOMoved(i, j) {
    state[1].addLast([i, j]);
    Queue<List<int>> oMoves = state[1];
    List removedRole = [];
    if (oMoves.length > 3) {
      removedRole = oMoves.first;
      oMoves.removeFirst();
    }
    state = [state[0], oMoves];
    return removedRole;
  }
}
