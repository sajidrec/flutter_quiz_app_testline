import 'package:flutter_quiz_app_testline/data/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {
  int _highScore = 0;

  int get getHighScore => _highScore;

  Future<void> fetchHighScore() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? highScore = sharedPreferences.getInt(Constants.highScoreKey);
    highScore ??= 0;
    _highScore = highScore;
    update();
  }
}
