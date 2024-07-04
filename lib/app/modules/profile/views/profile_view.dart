import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/modules/icon/bindings/icon_binding.dart';
import 'package:login_app/app/modules/icon/views/icon_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Profile',
          style: TextStyle(
          color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Se connecter'),
            subtitle: Text('Connectez-vous, plus excitant!'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Membre Premium'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: Icon(Icons.thumb_up),
            title: Text('Recommander à des amis'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('Noter l\'application'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: Icon(Icons.block),
            title: Text('Bloquer les publicités'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Réglages'),
            onTap: () {
              // Handle tap
            },
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
              SizedBox(width: 40),
              _buildNavItem(Icons.report, 'Reports', 2),
              _buildNavItem(Icons.person, 'Profile', 3),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => IconView(), binding: IconBinding()); // Navigate with binding
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, [VoidCallback? onTap]) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: controller.selectedIndex.value == index ? Colors.yellow : Colors.white,
          ),
          onPressed: onTap ?? () => controller.changeIndex(index),
        ),
        Text(
          label,
          style: TextStyle(
            color: controller.selectedIndex.value == index ? Colors.yellow : Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

