import 'package:flutter/material.dart';
import 'package:news_app/main.dart';

class Constants {
  static Size mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static const String apiKey = "edc500cd429e4824a872a7ad2f96cefe";
  static const String baseUrl = "newsapi.org";
}
