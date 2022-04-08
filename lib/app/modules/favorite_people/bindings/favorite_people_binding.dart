import 'package:get/get.dart';

import '../controllers/favorite_people_controller.dart';

class FavoritePeopleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritePeopleController>(
      () => FavoritePeopleController(),
    );
  }
}
