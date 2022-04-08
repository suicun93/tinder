import 'package:get/get.dart';

import '../../../common/const.dart';
import '../../../common/my_get_controller.dart';
import '../../../data/person.dart';
import '../providers/home_provider.dart';

class HomeController extends MyGetxController<HomeProvider> {
  final people = RxList<Person>();

  @override
  void onInit() {
    super.onInit();
    ever(
      people,
      (_) {
        if (people.length < 3) {
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
    } catch (e) {
      showSnackBar('Load Person failed');
    }
  }
}
