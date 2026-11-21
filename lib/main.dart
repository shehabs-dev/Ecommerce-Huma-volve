import 'package:flutter/material.dart';

import 'core/di/injection_container.dart';
import 'core/router/app_router.dart';
import 'core/theme.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}

// Hosting URL:  https://humavolve-store.web.app
