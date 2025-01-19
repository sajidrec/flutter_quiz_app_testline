import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_testline/data/utils/constants.dart';
import 'package:flutter_quiz_app_testline/presentation/pages/count_down_page.dart';
import 'package:flutter_quiz_app_testline/presentation/utils/app_color.dart';
import 'package:flutter_quiz_app_testline/presentation/widgets/app_exit_dialog_widget.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _initialFunc();
  }

  Future<void> _initialFunc() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    print(
        "Sajid testing ${sharedPreferences.getString(Constants.problemListKey)}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          AppExitDialogWidget().showDialog(context);
        },
        child: Scaffold(
          body: SizedBox(
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
                      Text(
                        "Highest Score 0",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
          ),
        ),
      ),
    );
  }
}
