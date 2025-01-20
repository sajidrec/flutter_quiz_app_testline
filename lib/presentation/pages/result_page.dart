import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_testline/data/utils/constants.dart';
import 'package:flutter_quiz_app_testline/presentation/pages/home_page.dart';
import 'package:flutter_quiz_app_testline/presentation/utils/app_color.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    super.key,
    required this.score,
  });

  final int score;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    super.initState();
    storeIfHighScore();
  }

  Future<void> storeIfHighScore() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    int? highestScore = sharedPreferences.getInt(Constants.highScoreKey);

    highestScore ??= 0;

    if (widget.score > highestScore) {
      await sharedPreferences.setInt(
        Constants.highScoreKey,
        widget.score,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientationBuilder) {
      return SafeArea(
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            Get.offAll(() => HomePage());
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text("Result"),
              centerTitle: true,
              backgroundColor: AppColor.primaryBlue,
              foregroundColor: AppColor.white,
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Icon(
                      Icons.emoji_events_outlined,
                      color: AppColor.primaryOrange,
                      size: Get.height / 3,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.score.toString(),
                      style: TextStyle(fontSize: Get.width / 4),
                    ),
                    Text(
                      "Your score",
                      style: TextStyle(fontSize: Get.width / 6),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
