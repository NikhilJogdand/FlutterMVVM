import 'package:mvvm/utils/routes_names.dart';
import 'package:mvvm/views/home_screen.dart';
import 'package:mvvm/views/login_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RouteName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
              body: Center(
                child: Text('No route defined'),
              )
          );
        });
    };
  }
}
