import 'package:bmj_onexamination/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:bmj_onexamination/main.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'images/screen-iphone-portrait@2x.png',
      splashIconSize: BouncingScrollSimulation.maxSpringTransferVelocity,
      nextScreen: LoginPage(),
      splashTransition: SplashTransition.fadeTransition,
      // duration: 1000,
      // pageTransitionType: PageTransitionType.scale,
    );
  }
}
