// GENERATED CODE - DO NOT MODIFY BY HAND

part of '3x3_board_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$winnerCheckHash() => r'c07e3afa8adfde91cbbe31567dd3f6f73ff0fef4';

/// See also [winnerCheck].
@ProviderFor(winnerCheck)
final winnerCheckProvider = AutoDisposeProvider<String>.internal(
  winnerCheck,
  name: r'winnerCheckProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$winnerCheckHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WinnerCheckRef = AutoDisposeProviderRef<String>;
String _$boardHash() => r'06bc7d34842f56b1a1fcca8d7dad6976f02e8fe2';

/// See also [Board].
@ProviderFor(Board)
final boardProvider =
    AutoDisposeNotifierProvider<Board, List<List<String>>>.internal(
  Board.new,
  name: r'boardProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$boardHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Board = AutoDisposeNotifier<List<List<String>>>;
String _$currentPlayerHash() => r'd8774310e74879eb296e2ccf52791012649704a8';

/// See also [CurrentPlayer].
@ProviderFor(CurrentPlayer)
final currentPlayerProvider =
    AutoDisposeNotifierProvider<CurrentPlayer, String>.internal(
  CurrentPlayer.new,
  name: r'currentPlayerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentPlayer = AutoDisposeNotifier<String>;
String _$scoreBoardHash() => r'8081c52bc3908459539d7b5e6cd119544e53ffac';

/// See also [ScoreBoard].
@ProviderFor(ScoreBoard)
final scoreBoardProvider =
    AutoDisposeNotifierProvider<ScoreBoard, List>.internal(
  ScoreBoard.new,
  name: r'scoreBoardProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$scoreBoardHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ScoreBoard = AutoDisposeNotifier<List>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
