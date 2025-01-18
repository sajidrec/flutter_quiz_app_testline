import 'package:dio/dio.dart';
import 'package:flutter_quiz_app_testline/data/utils/urls.dart';
import 'package:get/get.dart';

class SplashScreenControllers extends GetxController {
  Future<void> fetchDataFromApi() async {
    Dio dio = Dio();
    dynamic req = await dio.request(Urls.problemProviderApi);
    print("sajid testing ${req.data}");
  }
}
