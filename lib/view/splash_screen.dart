import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:product_catalog_app/view/product_list_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 
          Center(
            child: Lottie.asset( 
              'assets/animation/Animation - 1746290710872.json',
            ),
          ),
       
      nextScreen: ProductListScreen(),
      duration: 3500,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
      splashIconSize: 400,
      pageTransitionType: PageTransitionType.leftToRight,
    );
  }
}
