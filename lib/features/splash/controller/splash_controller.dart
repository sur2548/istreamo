import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:istreamo/config/routes/app_router.dart';
import 'package:istreamo/features/splash/state/splash_state.dart';

final splashControllerProvider =
    StateNotifierProvider.autoDispose<SplashController, SplashState>(
  (ref) => SplashController(),
);

class SplashController extends StateNotifier<SplashState> {
  SplashController() : super(const SplashState.loading()) {
    Future.delayed(
      const Duration(seconds: 3),
      () => state = const SplashState.completed(HomeRoute()),
    );
  }
}
