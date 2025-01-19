import 'package:flutter_quiz_app_testline/presentation/controllers/home_page_controller.dart';
import 'package:flutter_quiz_app_testline/presentation/controllers/quiz_page_controller.dart';
import 'package:flutter_quiz_app_testline/presentation/controllers/splash_screen_controllers.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenControllers());
    Get.put(HomePageController());
    Get.put(QuizPageController());
  }
}
