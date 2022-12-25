import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/constant/app_colors.dart';
import 'package:movie_app/view/home_page/home_page_controller.dart';
import 'package:movie_app/view/home_page/widgets/custom_genres_bar.dart';
import 'package:movie_app/view/home_page/widgets/custom_list_view.dart';
import 'package:movie_app/view/home_page/widgets/custom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) => controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.secondary,
              ),
            )
          : ListView(
              children: [
                const CustomText(text: "Now Playing"),
                CustomListView(
                  itemCont: controller.nowPlaying.length,
                  list: controller.nowPlaying,
                ),
                //--------
                const CustomText(text: "Movies"),
                CustomGenresBar(),
                CustomListView(
                  itemCont: controller.moviesByGenre.length,
                  list: controller.moviesByGenre,
                ),
                //--------
                const CustomText(text: "Trinding"),
                CustomListView(
                  itemCont: controller.trending.length,
                  list: controller.trending,
                ),
                const CustomText(text: "Upcoming"),
                CustomListView(
                  itemCont: controller.upcoming.length,
                  list: controller.upcoming,
                ),
              ],
            ),
    );
  }
}
