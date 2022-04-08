import 'package:get/get.dart';

import '../../../dom/database_helper.dart';

class FavoritePeopleController extends GetxController {
  final ready = false.obs;
  final listPeople = RxList<PersonDB>();

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadUserFromDB();
  }

  Future<void> loadUserFromDB() async {
    ready.value = false;
    listPeople.value = await DatabaseHelper.instance.read();
    ready.value = true;
  }
}
