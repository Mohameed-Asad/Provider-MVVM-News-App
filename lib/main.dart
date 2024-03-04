import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_theme_manager.dart';
import 'package:news_app/core/routes_manager/pages_routes.dart';
import 'package:news_app/core/routes_manager/route.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: AppThemeManager.appTheme,
      themeMode: ThemeMode.light,
      initialRoute: PagesRoutesName.splash,
      onGenerateRoute: Routes.onGenerateRoute,
      navigatorKey: navigatorKey,
    );
  }
}
