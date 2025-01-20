import 'package:flutter_quiz_app_testline/data/utils/constants.dart';
import 'package:flutter_quiz_app_testline/presentation/controllers/splash_screen_controllers.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {
  int _highScore = 0;
  bool _quizDataDownloaded = false;
  bool _tryingReconnect = false;

  bool get getTryingReconnectStatus => _tryingReconnect;

  bool get getQuizDataAvailableStatus => _quizDataDownloaded;

  int get getHighScore => _highScore;

  Future<void> fetchQuizDataDownloadStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey(Constants.problemListKey)) {
      final value = sharedPreferences.getString(Constants.problemListKey);
      if (value != null) {
        if (value.length > 3) {
          _quizDataDownloaded = true;
          update();
          return;
        }
      }
    }

    _quizDataDownloaded = false;

    update();
  }

  Future<void> reConnect() async {
    _tryingReconnect = true;
    update();
    await Get.find<SplashScreenControllers>().fetchDataFromApi();
    await fetchQuizDataDownloadStatus();

    Future.delayed(Duration(seconds: 2), () {
      _tryingReconnect = false;
      update();
    });
  }

  Future<void> fetchHighScore() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? highScore = sharedPreferences.getInt(Constants.highScoreKey);
    highScore ??= 0;
    _highScore = highScore;
    update();
  }
}
