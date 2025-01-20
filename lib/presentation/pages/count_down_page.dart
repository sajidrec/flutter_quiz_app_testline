import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_testline/presentation/pages/quiz_page.dart';
import 'package:flutter_quiz_app_testline/presentation/utils/app_color.dart';
import 'package:get/get.dart';

class CountDownPage extends StatefulWidget {
  const CountDownPage({super.key});

  @override
  State<CountDownPage> createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> {
  final _celebrationController = ConfettiController(
    duration: Duration(seconds: 2),
  );

  @override
  void dispose() {
    super.dispose();
    _celebrationController.dispose();
  }

  void celebrate() {
    _celebrationController.play();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientationBuilder) {
      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              ConfettiWidget(
                confettiController: _celebrationController,
                blastDirectionality: BlastDirectionality.explosive,
                // Set the blast direction
                numberOfParticles: 50,
                gravity: 0.3,
              ),
              Center(
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryDarkBlue,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText(
                        "3",
                        duration: Duration(milliseconds: 600),
                      ),
                      FadeAnimatedText(
                        "2",
                        duration: Duration(milliseconds: 600),
                      ),
                      FadeAnimatedText(
                        "1",
                        duration: Duration(milliseconds: 600),
                      ),
                    ],
                    totalRepeatCount: 1,
                    onFinished: () {
                      celebrate();
                      Future.delayed(
                        Duration(seconds: 2),
                        () => Get.off(
                          () => QuizPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
