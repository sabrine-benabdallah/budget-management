import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/icon_controller.dart';

class IconView extends GetView<IconController> {
  const IconView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Ajouter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, // Color of the back arrow
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(

              color: Colors.white10,
              child: Center(
                child: Obx(
                      () => ToggleButtons(
                    isSelected: Get.find<IconController>().isSelected,
                    children: [
                      TextButton(
                        onPressed: () =>
                            Get.find<IconController>().dependenciesButtom(),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: controller.showGridView.value ? Colors.white : null,
                            // Couleur et style du cadre
                            borderRadius: BorderRadius.circular(10),  // Optionnel: coins arrondis
                          ),


                          child: Text(
                            'Depended',
                            style: TextStyle(
                              fontSize: 25,
                              color: !controller.showGridView.value? Colors.white:Colors.black,
                            ),
                          ),


                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.find<IconController>().revenuButtom(),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color : !controller.showGridView.value? Colors.white: null,
                            // Couleur et style du cadre
                            borderRadius: BorderRadius.circular(10),
                            // Optionnel: coins arrondis
                          ),

                          child: Text(
                            'Revenus',
                            style: TextStyle(
                              fontSize: 25,
                              color: !controller.showGridView.value? Colors.black:Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.showGridView.value) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      children: [
                        _buildGridItem(Icons.school, 'education', Color(0xFF8A39A2)),
                        _buildGridItem(Icons.home, 'house', Color(0xFFB0C845)),
                        _buildGridItem(Icons.pool_sharp, 'sport', Color(0xFFD7263D)),
                        _buildGridItem(Icons.directions_car, 'car', Color(0xFFC381A9)),
                        _buildGridItem(Icons.volunteer_activism_rounded, 'donate', Color(0xFF6A5C57)),
                        _buildGridItem(Icons.medical_services_sharp, 'medical', Color(0xFF92D6B6)),
                        _buildGridItem(Icons.fastfood, 'fastfood', Color(0xFF4169E1)),
                        _buildGridItem(Icons.delivery_dining, 'delivery', Color(0xFFB0B0B0)),
                        _buildGridItem(Icons.savings, 'savings', Color(0xFFB08A6E)),
                        _buildGridItem(Icons.child_care_rounded, 'children', Color(0xFFD28B83)),
                        _buildGridItem(Icons.coffee_rounded, 'cofee', Color(0xFF7AA37A)),
                        _buildGridItem(Icons.miscellaneous_services_sharp, 'setting', Color(0xFFFFD700)),
                      ],
                    ),
                  );
                } else {
                  return GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    children: [
                      _buildGridItem(Icons.attach_money, 'salary', Color(0xFF8A39A2)),
                      _buildGridItem(Icons.trending_up, 'invest', Color(0xFFB0C845)),
                      _buildGridItem(Icons.work_outline, 'part time', Color(0xFFD7263D)),
                      _buildGridItem(Icons.card_giftcard, 'bonuses', Color(0xFFC381A9)),
                      _buildGridItem(Icons.more_horiz, 'others', Color(0xFF6A5C57)),
                      _buildGridItem(Icons.miscellaneous_services_sharp, 'setting', Color(0xFF92D6B6)),

                    ],
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String label, Color color) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: () {
              // Perform an action when the button is pressed
            },
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}