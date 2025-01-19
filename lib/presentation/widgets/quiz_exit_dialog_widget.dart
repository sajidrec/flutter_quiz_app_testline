import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_testline/presentation/controllers/quiz_page_controller.dart';
import 'package:flutter_quiz_app_testline/presentation/pages/home_page.dart';
import 'package:flutter_quiz_app_testline/presentation/utils/app_color.dart';
import 'package:get/get.dart';

class QuizExitDialogWidget {
  void showDialog() {
    Get.defaultDialog(
      title: "Exit the quiz?",
      titleStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      middleText: "Your current progress will not be counted.",
      middleTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.grey[700],
      ),
      backgroundColor: AppColor.white,
      radius: 10,
      barrierDismissible: false,
      // Prevent closing by tapping outside
      actions: [
        // Cancel Button
        ElevatedButton(
          onPressed: () {
            Get.back(); // Close the dialog
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.green,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(
            "Get back to quiz",
            style: TextStyle(color: AppColor.white),
          ),
        ),
        // Exit Button
        ElevatedButton(
          onPressed: () {
            Get.find<QuizPageController>().stopCounter();
            Get.offAll(() => HomePage());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.red,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(
            "I'm sure",
            style: TextStyle(color: AppColor.white),
          ),
        ),
      ],
    );
  }
}
