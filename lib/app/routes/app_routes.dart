part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const login = _Paths.login;
  static const home = _Paths.home;
  static const register = _Paths.register;
  static const profile = _Paths.profile;
}

abstract class _Paths {
  _Paths._();

  static const login = '/login';
  static const home = '/home';
  static const register = '/register';
  static const profile = '/profile';
}
