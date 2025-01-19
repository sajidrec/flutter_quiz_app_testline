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
    Get.find<QuizPageController>().fetchQuestionList();
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
                  GetBuilder<QuizPageController>(builder: (quizPageController) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Text(
                          quizPageController.getQuestionList[index]["id"]
                              .toString(),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 5);
                      },
                      itemCount: quizPageController.getQuestionList.length,
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
