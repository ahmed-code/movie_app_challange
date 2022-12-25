import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movie_app/constant/app_colors.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/view/favorite_page/favorite_page_contoller.dart';
import 'package:movie_app/view/home_page/widgets/custom_image_cart.dart';
import 'package:movie_app/view/home_page/widgets/custom_text.dart';

class FavoriteMovieCard extends StatelessWidget {
  final movieModel movie;
  const FavoriteMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    FavoritePageController controller = Get.find();

    return InkWell(
      onTap: () {
        controller.goToDetailsPage(movie);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3.5,
        child: LayoutBuilder(
          builder: (p0, p1) => Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomImageCard(imgURL: movie.posterPath!),
              ),
              SizedBox(
                width: p1.maxWidth / 40,
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: movie.title!),
                      Text(
                        movie.overview!,
                        style: const TextStyle(
                            fontSize: 16, color: AppColors.gray),
                        maxLines: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.grade,
                            color: AppColors.yellow,
                          ),
                          Text(
                            movie.voteAverage.toStringAsFixed(1),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
