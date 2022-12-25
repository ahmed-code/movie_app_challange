import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/constant/app_colors.dart';

import '../main_page_controller.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      init: MainPageController(),
      builder: (controller) => BottomNavigationBar(
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: AppColors.customWhite,
        currentIndex: controller.selectedBarIndex,
        onTap: (value) {
          controller.updateSelectedBarIndex(value);
        },
        items: const [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.favorite_outline),
          ),
        ],
      ),
    );
  }
}
