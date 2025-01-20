import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_testline/presentation/controllers/splash_screen_controllers.dart';
import 'package:flutter_quiz_app_testline/presentation/pages/home_page.dart';
import 'package:flutter_quiz_app_testline/presentation/utils/app_color.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await Get.find<SplashScreenControllers>().fetchDataFromApi();
    Future.delayed(
      Duration(seconds: 3),
      () async => await Get.offAll(
        () => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientationBuilder) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/splash_screen_logo.png",
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      CircularProgressIndicator(
                    color: AppColor.primaryBlue,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 5),
                  child: LinearProgressIndicator(
                    color: AppColor.primaryDarkBlue,
                    backgroundColor: AppColor.primaryBlue,
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
