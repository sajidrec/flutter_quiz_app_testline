import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_quiz_app_testline/data/utils/constants.dart';
import 'package:flutter_quiz_app_testline/presentation/pages/result_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizPageController extends GetxController {
  int _timeLeftMinute = 0;
  int _timeLeftSeconds = 0;
  bool _timesUp = true;
  List<dynamic> _questionList = [];
  Timer? _timer;
  int _currentQuizIndex = 0;

  int _currentScore = 0;

  int get getCurrentScore => _currentScore;

  int get getCurrentQuizIndex => _currentQuizIndex;

  List<dynamic> get getQuestionList => _questionList;

  int get getTimeLeftMinute => _timeLeftMinute;

  int get getTimeLeftSeconds => _timeLeftSeconds;

  bool get getTimesUpStatus => _timesUp;

  final List<bool> _answeredList = [];

  List<bool> get getAnsweredList => _answeredList;

  void increaseCurrentQuizIndex() {
    _currentQuizIndex++;
    update();
  }

  void setAsAnswered({
    required int index,
  }) {
    _answeredList[index] = true;
    update();
  }

  void updateCurrentScore({
    required int score,
  }) {
    _currentScore += score;
    update();
  }

  void decreaseCurrentQuizIndex() {
    if (_currentQuizIndex > 0) {
      _currentQuizIndex--;
    }
    update();
  }

  void startCounter() {
    _currentQuizIndex = 0;
    _currentScore = 0;
    _timeLeftMinute = 15;
    _timeLeftSeconds = 0;
    _timesUp = false;

    _answeredList.clear();
    for (int i = 0; i < 10; i++) {
      _answeredList.add(false);
    }
    update();

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (_timeLeftSeconds == 0 && _timeLeftMinute == 0) {
          _timesUp = true;
          update();
          _timer?.cancel();
          Get.off(
            () => ResultPage(
              score: _currentScore,
            ),
          );
        } else {
          if (_timeLeftSeconds > 0) {
            _timeLeftSeconds--;
          } else {
            _timeLeftSeconds = 59;
            _timeLeftMinute--;
          }
        }
        update();
      },
    );
  }

  void stopCounter() {
    _timer?.cancel();
  }

  Future<void> fetchQuestionList() async {
    final problemSetList = await _fetchProblem();
    _questionList = problemSetList;
    _questionList.shuffle(Random());
    update();
  }

  Future<dynamic> _fetchProblem() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey(Constants.problemListKey)) {
      if (sharedPreferences.getString(Constants.problemListKey) != null) {
        dynamic data = jsonDecode(
            sharedPreferences.getString(Constants.problemListKey) ?? "");

        return data["questions"];
      }
    }

    return [];
  }
}
