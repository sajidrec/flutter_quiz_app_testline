import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_testline/presentation/controllers/quiz_page_controller.dart';
import 'package:flutter_quiz_app_testline/presentation/widgets/quiz_exit_dialog_widget.dart';
import 'package:get/get.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
    Get.find<QuizPageController>().startCounter();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          QuizExitDialogWidget().showDialog();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  GetBuilder<QuizPageController>(
                    builder: (quizPageController) {
                      return Text(
                        "Time left ${quizPageController.getTimeLeftMinute}:${quizPageController.getTimeLeftSeconds}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
