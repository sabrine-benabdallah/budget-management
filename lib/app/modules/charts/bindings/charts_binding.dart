import 'package:get/get.dart';

import '../controllers/charts_controller.dart';

class ChartsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartsController>(
      () => ChartsController(),
    );
  }
}
