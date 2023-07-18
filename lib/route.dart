import 'package:bmj_onexamination/main.dart';
import 'package:bmj_onexamination/pages/login_page.dart';
import 'package:flutter/material.dart';

class Route extends StatelessWidget {
  const Route({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => const MyHomePage(title: 'DASHBOARD'),
      },
    );
  }
}
