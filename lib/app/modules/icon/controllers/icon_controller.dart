import 'package:get/get.dart';

class IconController extends GetxController {
  RxBool isActive = false.obs;
  List<bool> isSelected = [
    false,
    false,
  ].obs;
  var showGridView = true.obs;

  void toggle(index) {
    isSelected[index] = !isSelected[index];
  }

  void dependenciesButton() {
    showGridView.value = true;
  }

  void incomeButton() {
    showGridView.value = false;
  }
}
