import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/const.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  var ready = true.obs;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      1500.milliseconds,
      login,
    );
  }

  login() async {
    Get.offAndToNamed(Routes.home);
  }

  @override
  void onClose() {
    SystemChrome.setSystemUIOverlayStyle(defaultSystemUiOverlayStyle);
  }
}
