import 'package:get/get.dart';

class CalendarController extends GetxController {
  final count = 0.obs;

  @override
  void onClose() {}

  void increment() => count.value++;
}
