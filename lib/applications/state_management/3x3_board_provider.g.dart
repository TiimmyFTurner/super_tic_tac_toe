// GENERATED CODE - DO NOT MODIFY BY HAND

part of '3x3_board_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$winnerCheckHash() => r'9c2263b03cc03bdb06777b4269c8825278465945';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [winnerCheck].
@ProviderFor(winnerCheck)
const winnerCheckProvider = WinnerCheckFamily();

/// See also [winnerCheck].
class WinnerCheckFamily extends Family<String> {
  /// See also [winnerCheck].
  const WinnerCheckFamily();

  /// See also [winnerCheck].
  WinnerCheckProvider call(
    String currentPlayer,
  ) {
    return WinnerCheckProvider(
      currentPlayer,
    );
  }

  @override
  WinnerCheckProvider getProviderOverride(
    covariant WinnerCheckProvider provider,
  ) {
    return call(
      provider.currentPlayer,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'winnerCheckProvider';
}

/// See also [winnerCheck].
class WinnerCheckProvider extends AutoDisposeProvider<String> {
  /// See also [winnerCheck].
  WinnerCheckProvider(
    String currentPlayer,
  ) : this._internal(
          (ref) => winnerCheck(
            ref as WinnerCheckRef,
            currentPlayer,
          ),
          from: winnerCheckProvider,
          name: r'winnerCheckProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$winnerCheckHash,
          dependencies: WinnerCheckFamily._dependencies,
          allTransitiveDependencies:
              WinnerCheckFamily._allTransitiveDependencies,
          currentPlayer: currentPlayer,
        );

  WinnerCheckProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currentPlayer,
  }) : super.internal();

  final String currentPlayer;

  @override
  Override overrideWith(
    String Function(WinnerCheckRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WinnerCheckProvider._internal(
        (ref) => create(ref as WinnerCheckRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currentPlayer: currentPlayer,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _WinnerCheckProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WinnerCheckProvider && other.currentPlayer == currentPlayer;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currentPlayer.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WinnerCheckRef on AutoDisposeProviderRef<String> {
  /// The parameter `currentPlayer` of this provider.
  String get currentPlayer;
}

class _WinnerCheckProviderElement extends AutoDisposeProviderElement<String>
    with WinnerCheckRef {
  _WinnerCheckProviderElement(super.provider);

  @override
  String get currentPlayer => (origin as WinnerCheckProvider).currentPlayer;
}

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
