import 'package:get/get.dart';

import '../modules/favorite_people/bindings/favorite_people_binding.dart';
import '../modules/favorite_people/views/favorite_people_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.favoritePeople,
      page: () => const FavoritePeopleView(),
      binding: FavoritePeopleBinding(),
    ),
  ];
}
