import 'package:get/get_connect/connect.dart';
import 'package:tinder/app/data/person.dart';

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
}
