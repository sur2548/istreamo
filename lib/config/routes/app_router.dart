import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:istreamo/features/features.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: HomeScreen),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
