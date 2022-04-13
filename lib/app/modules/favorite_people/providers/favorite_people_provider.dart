import 'package:get/get_connect/connect.dart';
import '../../../data/person.dart';
import '../../../dom/database_helper.dart';

class FavoritePeopleProvider extends GetConnect {
  Future<List<PersonDB>> getFavoritePeople() async {
    return DatabaseHelper.instance.read();
  }
}
