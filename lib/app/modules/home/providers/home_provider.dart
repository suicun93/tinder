import 'package:get/get_connect/connect.dart';
import '../../../data/person.dart';
import '../../../dom/database_helper.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://randomuser.me/';
    httpClient.defaultDecoder = (map) => Result.fromJson(map);
  }

  Future<Response<Result>> getPerson() async {
    return get(
      'api',
    );
  }

  Future<void> saveToFavoriteList(Person currentPerson) {
    return DatabaseHelper.instance.save(currentPerson);
  }
}
