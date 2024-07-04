import 'package:get/get.dart';
import 'package:login_app/app/modules/charts/views/charts_view.dart';
import 'package:login_app/app/modules/home/views/home_view.dart';
import 'package:login_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:login_app/app/modules/profile/views/profile_view.dart';
import 'package:login_app/app/modules/reports/views/reports_view.dart';

class ProfileController extends GetxController {
  final count = 0.obs;
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
    if (index == 3) {
      Get.to(() => const ProfileView(), binding: ProfileBinding());
    } else if (index == 1) {
      Get.to(() => ChartsView());
    } else if (index == 0) {
      Get.to(() => HomeView());
    } else if (index == 2) {
      Get.to(() => const ReportsView());
    }
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
