import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/const.dart';
import '../../../common/my_get_controller.dart';
import '../../../data/person.dart';
import '../../../dom/database_helper.dart';
import '../../../routes/app_pages.dart';
import '../providers/home_provider.dart';

class HomeController extends MyGetxController<HomeProvider> {
  final people = RxList<Person>();

  // Serve UI animation
  final position = Offset.zero.obs;
  final angel = (0.0).obs;

  @override
  void onInit() {
    super.onInit();
    // Once people list changed, check list's length to load more
    // limit = 5
    ever(
      people,
      (_) {
        if (people.length < 5) {
          loadMoreUser();
        }
      },
    );
    loadMoreUser();
  }

  loadMoreUser() async {
    try {
      final result = await provider?.getPerson();

      if (!result!.isOk) {
        showSnackBar('Load Person failed');
      }

      if (result.body!.persons!.isEmpty) {
        showSnackBar('Load Person failed');
      }

      people.add(result.body!.persons!.first);
      // print('Loaded 1 more person to list');
    } catch (e) {
      showSnackBar('Load Person failed');
    }
  }

  void onPanEnd(DragEndDetails details) {
    // Check like/dislike
    final Person currentPerson = people.removeAt(0);
    if (position.value.dx >= 100) {
      like(currentPerson);
    }
    // Reset position
    position.value = Offset.zero;
    angel.value = 0;
  }

  void onPanUpdate(DragUpdateDetails details) {
    position.value += details.delta;
    final x = position.value.dx;
    angel.value = 30 * x / Get.width;
  }

  Future<void> like(Person currentPerson) async {
    await DatabaseHelper.instance.save(currentPerson);
    showSnackBar('Liked ${currentPerson.name?.fullName ?? ''}');
  }

  void favoriteListClicked() {
    Get.toNamed(Routes.favoritePeople);
  }
}
