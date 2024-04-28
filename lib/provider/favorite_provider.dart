import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shewaber/models/character.dart';

class FavoriteStateNotifier extends StateNotifier<List<Character>> {
  FavoriteStateNotifier() : super([]);

  void addFavorite(Character character) {
    if (!state.contains(character)) {
      state = [...state, character];
    }
  }

  void removeFavorite(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  bool isFavorite(Character char) {
    return state.contains(char);
  }
}

final favoriteProvider =
    StateNotifierProvider<FavoriteStateNotifier, List<Character>>((ref) {
  return FavoriteStateNotifier();
});
