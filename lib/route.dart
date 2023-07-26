import 'package:bmj_onexamination/pages/create_account_page.dart';
import 'package:bmj_onexamination/pages/dashboard_page.dart';
import 'package:bmj_onexamination/pages/login_page.dart';
import 'package:bmj_onexamination/splash.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  // const Route({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     routes: {
  //       '/login': (context) => LoginPage(),
  //       '/dashboard': (context) => const MyHomePage(title: 'Dashboard'),
  //     },
  //   );
  // }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Splash());
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
        break;
      case '/dashboard':
        return MaterialPageRoute(
            builder: (_) => MyHomePage(title: 'Dashboard'));
        break;
      case '/createaccount':
        return MaterialPageRoute(builder: (_) => CreateNewAccountPage());
      default:
        return MaterialPageRoute(builder: (_) => Splash());
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return AlertDialog(title: Text('Error Page'));
    });
  }
}
