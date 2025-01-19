import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_testline/presentation/controllers/quiz_page_controller.dart';
import 'package:flutter_quiz_app_testline/presentation/pages/result_page.dart';
import 'package:flutter_quiz_app_testline/presentation/utils/app_color.dart';
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
                  GetBuilder<QuizPageController>(
                    builder: (quizPageController) {
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            "Current Score : 1000",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              quizPageController.getQuestionList[
                                      quizPageController.getCurrentQuizIndex]
                                  ["description"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Text("data"),
                              const SizedBox(height: 5),
                              Text("data"),
                              const SizedBox(height: 5),
                              Text("data"),
                              const SizedBox(height: 5),
                              Text("data"),
                              const SizedBox(height: 5),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        quizPageController
                                            .decreaseCurrentQuizIndex();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.primaryBlue,
                                        foregroundColor: AppColor.white,
                                      ),
                                      child: Text("Previous"),
                                    ),
                                    Spacer(),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (quizPageController
                                                .getCurrentQuizIndex >=
                                            9) {
                                          quizPageController.stopCounter();
                                          Get.off(() => ResultPage());
                                        } else {
                                          quizPageController
                                              .increaseCurrentQuizIndex();
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColor.primaryDarkBlue,
                                        foregroundColor: AppColor.white,
                                      ),
                                      child: Text("Next"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
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
