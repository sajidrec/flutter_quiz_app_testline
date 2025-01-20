import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_quiz_app_testline/data/utils/constants.dart';
import 'package:flutter_quiz_app_testline/data/utils/urls.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenControllers extends GetxController {
  Future<void> fetchDataFromApi() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    bool alreadyHaveProblems = false;

    if (sharedPreferences.containsKey(Constants.problemListKey)) {
      final value = sharedPreferences.getString(Constants.problemListKey);
      if (value != null) {
        alreadyHaveProblems = true;
      }
    }

    if (!alreadyHaveProblems) {
      Dio dio = Dio();
      CancelToken cancelToken = CancelToken();

      try {
        final req = await dio.request(
          Urls.problemProviderApi,
          cancelToken: cancelToken,
        );

        Future.delayed(
          Duration(seconds: 5),
          () {
            cancelToken.cancel();
          },
        );

        await sharedPreferences.setString(
          Constants.problemListKey,
          jsonEncode(req.data),
        );
      } catch (e) {}
    }
  }
}
