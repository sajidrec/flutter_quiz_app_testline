import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quiz_app_testline/presentation/utils/app_color.dart';
import 'package:get/get.dart';

class AppExitDialogWidget {
  void showDialog(BuildContext context) {
    Get.defaultDialog(
      title: "Exit?",
      titleStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      middleText: "Are you sure you want to exit?",
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
            "Cancel",
            style: TextStyle(color: AppColor.white),
          ),
        ),
        // Exit Button
        ElevatedButton(
          onPressed: () {
            // Exit the app
            SystemNavigator.pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.red,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(
            "Exit",
            style: TextStyle(color: AppColor.white),
          ),
        ),
      ],
    );
  }
}
