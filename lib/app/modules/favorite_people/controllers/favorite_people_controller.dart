import 'package:get/get.dart';

import '../../../common/my_get_controller.dart';
import '../../../dom/database_helper.dart';
import '../providers/favorite_people_provider.dart';

class FavoritePeopleController
    extends MyGetxController<FavoritePeopleProvider> {
  final ready = false.obs;
  final listPeople = RxList<PersonDB>();

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadUserFromDB();
  }

  Future<void> loadUserFromDB() async {
    ready.value = false;
    listPeople.value = await provider!.getFavoritePeople();
    ready.value = true;
  }
}
