import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_testline/presentation/components/app_exit_dialog_component.dart';
import 'package:flutter_quiz_app_testline/presentation/controllers/home_page_controller.dart';
import 'package:flutter_quiz_app_testline/presentation/pages/count_down_page.dart';
import 'package:flutter_quiz_app_testline/presentation/utils/app_color.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _fetchHighScore();
    _callDataAvailableChecker();
  }

  Future<void> _fetchHighScore() async {
    await Get.find<HomePageController>().fetchHighScore();
  }

  Future<void> _callDataAvailableChecker() async {
    await Get.find<HomePageController>().fetchQuizDataDownloadStatus();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientationBuilder) {
      return SafeArea(
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            AppExitDialogComponent().showDialog(context);
          },
          child: Scaffold(
            body: GetBuilder<HomePageController>(builder: (homePageController) {
              return (!homePageController.getQuizDataAvailableStatus)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "No data available please connect to internet and hit reconnect to try again.",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await homePageController.reConnect();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primaryBlue,
                              foregroundColor: AppColor.white,
                            ),
                            child: (homePageController.getTryingReconnectStatus)
                                ? CircularProgressIndicator(
                                    color: AppColor.white,
                                  )
                                : Text("Reconnect"),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      width: Get.width,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 5,
                            right: 8,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.emoji_events,
                                  color: AppColor.primaryOrange,
                                  size: 50,
                                ),
                                GetBuilder<HomePageController>(
                                    builder: (controller) {
                                  return Text(
                                    "Highest Score ${controller.getHighScore}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryBlue,
                                foregroundColor: AppColor.white,
                                shadowColor: AppColor.primaryDarkBlue,
                                minimumSize: Size(50, 50),
                                elevation: 5,
                              ),
                              onPressed: () {
                                Get.to(
                                  () => CountDownPage(),
                                );
                              },
                              child: Text(
                                "Start the quiz",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            }),
          ),
        ),
      );
    });
  }
}
