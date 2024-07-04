import 'package:get/get.dart';
import 'package:login_app/app/modules/home/bindings/home_binding.dart';
import 'package:login_app/app/modules/home/views/home_view.dart';
import 'package:login_app/app/modules/login/bindings/login_binding.dart';
import 'package:login_app/app/modules/login/views/login_view.dart';
import 'package:login_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:login_app/app/modules/profile/views/profile_view.dart';
import 'package:login_app/app/modules/register/bindings/register_binding.dart';
import 'package:login_app/app/modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    )
  ];
}
