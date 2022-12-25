import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/constant/app_colors.dart';
import 'package:movie_app/view/details_page/details_page_controller.dart';
import 'package:movie_app/view/details_page/widgets/movie_genres_list.dart';
import 'package:movie_app/view/home_page/widgets/custom_image_cart.dart';
import 'package:movie_app/view/home_page/widgets/custom_text.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsPageController controller = Get.put(DetailsPageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movie Detail",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        leading: IconButton(
            onPressed: () {
              controller.pop();
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          GetBuilder<DetailsPageController>(
            init: DetailsPageController(),
            builder: (controller) => IconButton(
              onPressed: () {
                controller.isFavorite
                    ? controller.removeFromFavorite()
                    : controller.addToFavorite();
              },
              icon: controller.isFavorite
                  ? const Icon(
                      Icons.favorite,
                      color: AppColors.secondary,
                    )
                  : const Icon(
                      Icons.favorite_outline,
                      color: AppColors.secondary,
                    ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<DetailsPageController>(
          builder: (controller) => controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.secondary,
                  ),
                )
              : ListView(
                  children: [
                    CustomImageCard(imgURL: controller.movie!.backdropPath!),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomText(text: controller.movie!.title!),
                          ),
                          const Icon(
                            Icons.grade,
                            color: AppColors.yellow,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          CustomText(
                              text:
                                  "${(controller.movie!.voteAverage).toStringAsFixed(1)}"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                      child: const MovieGenresList(),
                    ),
                    const CustomText(text: "Description"),
                    Text(
                      controller.movie!.overview!,
                      style:
                          const TextStyle(fontSize: 16, color: AppColors.gray),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
