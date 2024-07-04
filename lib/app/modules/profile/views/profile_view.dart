import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/modules/icon/bindings/icon_binding.dart';
import 'package:login_app/app/modules/icon/views/icon_view.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Log In'),
            subtitle: const Text('Log in, more exciting!'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Member Premium'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.thumb_up),
            title: const Text('Recommend to friends'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.rate_review),
            title: const Text('Rate the application'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.block),
            title: const Text('Block ads'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Parameter'),
            onTap: () {},
          ),
        ],
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
