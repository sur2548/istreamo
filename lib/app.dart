import 'package:istreamo/config/env/env_config.dart';
import 'package:istreamo/config/themes/custom_theme.dart';
import 'package:flutter/material.dart';

import 'config/routes/app_router.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: EnvConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.defaultTheme(context),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
