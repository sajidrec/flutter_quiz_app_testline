import 'dart:async';

import 'package:flutter_quiz_app_testline/presentation/pages/result_page.dart';
import 'package:get/get.dart';

class QuizPageController extends GetxController {
  int _timeLeftMinute = 0;
  int _timeLeftSeconds = 0;
  bool _timesUp = true;

  Timer? _timer;

  int get getTimeLeftMinute => _timeLeftMinute;

  int get getTimeLeftSeconds => _timeLeftSeconds;

  bool get getTimesUpStatus => _timesUp;

  void startCounter() {
    _timeLeftMinute = 15;
    _timeLeftSeconds = 0;
    _timesUp = false;
    update();

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (_timeLeftSeconds == 0 && _timeLeftMinute == 0) {
          _timesUp = true;
          update();
          _timer?.cancel();
          Get.off(() => ResultPage());
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
}
