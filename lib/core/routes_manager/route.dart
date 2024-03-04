import 'package:flutter/material.dart';
import 'package:news_app/core/routes_manager/pages_routes.dart';
import 'package:news_app/screens/home_screen/pages/home_screen.dart';
import 'package:news_app/screens/splash_screen/splash_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutesName.splash:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      case PagesRoutesName.home:
        return MaterialPageRoute(
            builder: (context) => HomeScreen(), settings: settings);

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
