import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

class Constants {
  static Size mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);
}
