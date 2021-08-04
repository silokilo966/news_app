import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/home_page.dart';
import 'package:flutter_project/Screens/login_screen.dart';
import 'package:flutter_project/Screens/register_screen.dart';

class Routes {
  static const loginScreen = '/';
  static const homePage = '/homePage';
  static const registerScreen = '/registerScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );

      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );

      case registerScreen:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        );
      default:
        throw FormatException("Route not found! Check routes again");
    }
  }
}
