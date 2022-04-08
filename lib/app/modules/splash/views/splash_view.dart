import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/const.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Column(
          children: [
            const Spacer(flex: 10),
            Center(
              child: Image.asset('assets/images/logo.png', width: size * 0.2),
            ),
            const Spacer(),
            const Text(
              'Tinder',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            const Spacer(flex: 15),
          ],
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryColor,
              subPrimaryColor,
            ],
            begin: FractionalOffset(0, 1),
            end: FractionalOffset(1, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
      ),
    );
  }
}
