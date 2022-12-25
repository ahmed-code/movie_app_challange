import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/constant/app_colors.dart';
import 'package:movie_app/view/home_page/home_page_controller.dart';

class CustomGenresBar extends StatelessWidget {
  const CustomGenresBar({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.genres.length,
          itemBuilder: (context, i) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                controller.updateSelectedGenres(controller.genres[i]['id']);
              },
              child: controller.selectedGenres == controller.genres[i]['id']
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.customDark,
                      ),
                      child: FittedBox(
                        child: Text(
                          controller.genres[i]['name'],
                          style: const TextStyle(color: AppColors.secondary),
                        ),
                      ),
                    )
                  : FittedBox(
                      child: Text(
                        controller.genres[i]['name'],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
