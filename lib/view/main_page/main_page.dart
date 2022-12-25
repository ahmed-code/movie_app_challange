import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movie_app/view/main_page/main_page_controller.dart';
import 'package:movie_app/view/main_page/widgets/bottom_bar.dart';

import '../../services.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainPageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NiceMovie",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      bottomNavigationBar: const BottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<MainPageController>(
              builder: (controller) =>
                  controller.pages[controller.selectedBarIndex]),
        ),
      ),
    );
  }
}
