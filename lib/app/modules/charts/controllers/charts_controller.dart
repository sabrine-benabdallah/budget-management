import 'package:get/get.dart';

class ChartsController extends GetxController {
  //TODO: Implement ChartsController

  final count = 0.obs;
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
