import 'package:get/get.dart';
import 'package:login_app/app/modules/home/views/home_view.dart';
import 'package:login_app/app/modules/charts/views/charts_view.dart';
import 'package:login_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:login_app/app/modules/profile/views/profile_view.dart';
import 'package:login_app/app/modules/reports/views/reports_view.dart';

class HomeController extends GetxController {
  var expenses = 300.obs;
  var income = 1500.obs;
  var balance = 1200.obs;
  var pageIndex = 0.obs;
  var selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
    if (index == 3) {
      Get.to(() => ProfileView(), binding: ProfileBinding());
    } else if (index == 1) {
      Get.to(() => ChartsView());
    } else if (index == 0) {
      Get.to(() => HomeView());
    } else if (index == 2) {
      Get.to(() => ReportsView());
    }
  }

  void updateExpenses(int value) {
    expenses.value = value;
  }

  void updateIncome(int value) {
    income.value = value;
  }
}
