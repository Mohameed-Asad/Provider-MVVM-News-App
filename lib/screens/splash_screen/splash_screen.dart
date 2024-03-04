import 'package:flutter/material.dart';
import 'package:news_app/core/routes_manager/pages_routes.dart';
import 'package:news_app/core/widgets/background_widget.dart';
import 'package:news_app/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        navigatorKey.currentState!.pushReplacementNamed(PagesRoutesName.home);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(child: Image.asset("assets/images/logo.png"));
  }
}
