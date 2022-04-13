import 'package:get/get.dart';

import '../controllers/favorite_people_controller.dart';
import '../providers/favorite_people_provider.dart';

class FavoritePeopleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritePeopleController>(
      () => FavoritePeopleController(),
    );
    Get.lazyPut<FavoritePeopleProvider>(
      () => FavoritePeopleProvider(),
    );
  }
}
