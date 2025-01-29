import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_tic_tac_toe/applications/state_management/shared_preferences_provider.dart';

part 'game_config_provider.g.dart';

@Riverpod(keepAlive: true)
class PlayerPic extends _$PlayerPic {
  dynamic _prefs;

  @override
  Map<String, int> build() {
    _prefs = ref.watch(sharedPreferencesProvider);
    final playerXPic = _prefs.getInt('PlayerXPic') ?? 1;
    final playerOPic = _prefs.getInt('PlayerOPic') ?? 1;
    return {
      "X": playerXPic,
      "O": playerOPic,
    };
  }

  void changePic(String player, int pic) {
    Map<String, int> newState = state;
    newState[player] = pic;
    state = newState;
    _prefs.setInt('Player${player}Pic', pic);
  }
}
