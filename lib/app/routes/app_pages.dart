import 'package:get/get.dart';
import 'package:login_app/app/modules/home/bindings/home_binding.dart';
import 'package:login_app/app/modules/home/views/home_view.dart';
import 'package:login_app/app/modules/login/bindings/login_binding.dart';
import 'package:login_app/app/modules/login/views/login_view.dart';
import 'package:login_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:login_app/app/modules/profile/views/profile_view.dart';
import 'package:login_app/app/modules/register/views/register_view.dart';
import 'package:login_app/app/modules/register/bindings/register_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegistrationPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    )
  ];
}
