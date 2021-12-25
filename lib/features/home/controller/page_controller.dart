import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageControllerProvider =
    StateNotifierProvider<PageController, int>((ref) {
  return PageController();
});

class PageController extends StateNotifier<int> {
  PageController() : super(1);

  void increment() {
    state = state + 1;
  }
}
