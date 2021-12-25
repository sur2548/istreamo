import 'package:auto_route/auto_route.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState.loading() = _Loading;

  const factory SplashState.completed(PageRouteInfo route) = _Completed;
}
