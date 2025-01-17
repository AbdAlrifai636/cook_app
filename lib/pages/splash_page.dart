

import 'package:cooc_project/pages/choose_lang_page.dart';
import 'package:cooc_project/res/color_app.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ChooseLangPage(),
              ),
            ));

    return Scaffold(
        backgroundColor: ColorApp.PRIMERY,
        body: Center(
          child: Image(image: AssetImage("assets/images/splash_icon.png")),
        ));
  }
}
