import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenStateNotifier extends StateNotifier<int> {
  ScreenStateNotifier() : super(0);

  void changeScreen(int index) {
    state = index;
  }
}

final screenStateProvider =
    StateNotifierProvider<ScreenStateNotifier, int>((ref) {
  return ScreenStateNotifier();
});
