import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:istreamo/config/env/env_config.dart';
import 'package:istreamo/features/splash/controller/splash_controller.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(splashControllerProvider);

    controller.whenOrNull(completed: (route) => context.router.replace(route));

    return const Scaffold(
      body: Center(child: Text(EnvConfig.appName)),
    );
  }
}
