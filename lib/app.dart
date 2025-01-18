import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_testline/controller_binder.dart';
import 'package:flutter_quiz_app_testline/presentation/pages/splash_screen.dart';
import 'package:get/get.dart';

class QuizAppTestLine extends StatelessWidget {
  const QuizAppTestLine({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      initialBinding: ControllerBinder(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
