import 'package:get/get.dart';

class ChartsController extends GetxController {
  final count = 0.obs;
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
