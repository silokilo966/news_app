import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/login_screen.dart';
import 'package:flutter_project/Screens/news_pages/apple.dart';
import 'package:flutter_project/Screens/news_pages/business.dart';
import 'package:flutter_project/Screens/news_pages/techcrunch.dart';
import 'package:flutter_project/Screens/news_pages/tesla.dart';
import 'package:flutter_project/Screens/news_pages/wallstreet_journal.dart';
import 'package:flutter_project/Screens/register_screen.dart';

class Routes {
  static const loginScreen = '/';
  static const registerScreen = '/registerScreen';
  static const applePage = '/ApplePage';
  static const teslaPage = '/TeslaPage';
  static const businessPage = '/BusinessPage';
  static const techCrunch = '/TechCrunchPage';
  static const wallStreet = '/WallStreetPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case applePage:
        return MaterialPageRoute(
          builder: (context) => ApplePage(),
        );

      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );

      case registerScreen:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        );

      case teslaPage:
        return MaterialPageRoute(
          builder: (context) => TeslaPage(),
        );

      case businessPage:
        return MaterialPageRoute(
          builder: (context) => BusinessPage(),
        );

      case techCrunch:
        return MaterialPageRoute(
          builder: (context) => TechcrunchPage(),
        );

      case wallStreet:
        return MaterialPageRoute(
          builder: (context) => WallstreetPage(),
        );
      default:
        throw FormatException("Route not found! Check routes again");
    }
  }
}
