import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/login_screen.dart';
import 'package:flutter_project/Screens/news_pages/apple.dart';
import 'package:flutter_project/Screens/news_pages/business.dart';
import 'package:flutter_project/Screens/news_pages/techcrunch.dart';
import 'package:flutter_project/Screens/news_pages/tesla.dart';
import 'package:flutter_project/Screens/news_pages/wallstreet_journal.dart';
import 'package:flutter_project/Screens/register_screen.dart';

class Routes {
  static const applePage = '/';
  static const loginScreen = '/loginScreen';
  static const registerScreen = '/registerScreen';
  static const teslaPage = '/TeslaPage';
  static const businessPage = '/BusinessPage';
  static const techCrunch = '/TechCrunchPage';
  static const wallStreet = '/WallStreetPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case applePage:
        return MaterialPageRoute(
            builder: (context) => ApplePage(), settings: settings);

      case loginScreen:
        return MaterialPageRoute(
            builder: (context) => LoginScreen(), settings: settings);

      case registerScreen:
        return MaterialPageRoute(
            builder: (context) => RegisterScreen(), settings: settings);

      case teslaPage:
        return MaterialPageRoute(
            builder: (context) => TeslaPage(), settings: settings);

      case businessPage:
        return MaterialPageRoute(
            builder: (context) => BusinessPage(), settings: settings);

      case techCrunch:
        return MaterialPageRoute(
            builder: (context) => TechcrunchPage(), settings: settings);

      case wallStreet:
        return MaterialPageRoute(
            builder: (context) => WallstreetPage(), settings: settings);
      default:
        throw FormatException("Route not found! Check routes again");
    }
  }
}
