import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/modules/Calendrier/views/calendrier_view.dart';
import 'package:login_app/app/modules/home/controllers/home_controller.dart';
import 'package:login_app/app/modules/icon/bindings/icon_binding.dart';
import 'package:login_app/app/modules/icon/views/icon_view.dart'; // Import from the new location

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Budget Management',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.white),
            onPressed: () {
              Get.to(CalendrierView());
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Column(
                        children: [
                          Text(
                            '2024',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'June',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Expenses',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Obx(
                            () => Text(
                              '${controller.expenses.value}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Income',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Obx(
                            () => Text(
                              '${controller.income.value}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Balance',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Obx(
                            () => Text(
                              '${controller.balance}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.money),
                    iconColor: Colors.white,
                    title: Text('Salary'),
                    textColor: Colors.grey,
                    trailing:
                        Text('1 500', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.school),
                    iconColor: Colors.white,
                    title: Text('Education'),
                    textColor: Colors.grey,
                    trailing:
                        Text('-300', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          height: 75,
          color: Colors.black87,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0),
              _buildNavItem(Icons.bar_chart, 'Charts', 1),
              const SizedBox(width: 40),
              _buildNavItem(Icons.report, 'Reports', 2),
              _buildNavItem(Icons.person, 'Profile', 3),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const IconView(),
              binding: IconBinding()); // Navigate with binding
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
