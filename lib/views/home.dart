import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/controllers/homecontroller.dart';
import 'package:flutter_application_1/views/cars.dart';
import 'package:flutter_application_1/views/category.dart';
import 'package:flutter_application_1/views/dashboard.dart';
import 'package:flutter_application_1/views/orders.dart';
import 'package:flutter_application_1/views/profile.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    // Replace these with your real pages (dashboard, orders, etc.)
    final pages = const [
      DashboardScreen(),
      CategoryScreen(),
      CarsScreen(),
      OrdersScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: Obx(() => pages[controller.activeIndex.value]),
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          icons: const [
            Icons.dashboard,
            Icons.category,
            Icons.directions_car,
            Icons.shopping_cart,
            Icons.person,
          ],
          activeIndex: controller.activeIndex.value,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: controller.updateActiveIndex,
          backgroundColor: primaryColor,
          activeColor: Colors.white,
          inactiveColor: Colors.white54,
        ),
      ),
    );
  }
}
