import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/modules/charts/controllers/charts_controller.dart';
import 'package:login_app/app/modules/home/views/home_view.dart';
import 'package:login_app/app/modules/icon/views/icon_view.dart';

class ChartsView extends StatelessWidget {
  ChartsView({super.key});

  final ChartsController controller = Get.put(ChartsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Charts',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Charts Page Content Here'),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          height: 75,
          color: Colors.black87,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0, () => Get.to(HomeView())),
              _buildNavItem(
                  Icons.bar_chart, 'Charts', 1, () => Get.to(ChartsView())),
              const SizedBox(width: 40),
              _buildNavItem(Icons.report, 'Reports', 2),
              _buildNavItem(Icons.person, 'Profile', 3),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const IconView());
        },
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index,
      [VoidCallback? onTap]) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: controller.selectedIndex.value == index
                ? Colors.yellow
                : Colors.white,
          ),
          onPressed: onTap ?? () => controller.changeIndex(index),
        ),
        Text(
          label,
          style: TextStyle(
            color: controller.selectedIndex.value == index
                ? Colors.yellow
                : Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
