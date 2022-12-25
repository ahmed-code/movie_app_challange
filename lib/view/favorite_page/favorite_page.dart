import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/view/favorite_page/favorite_page_contoller.dart';
import 'package:movie_app/view/favorite_page/widgets/favorite_movie_cart.dart';
import 'package:movie_app/view/home_page/widgets/custom_text.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Favorite"),
            GetBuilder<FavoritePageController>(
              init: FavoritePageController(),
              builder: (controller) => Expanded(
                child: ListView.builder(
                  itemCount: controller.favoriteMovies.length,
                  itemBuilder: (context, i) => FavoriteMovieCard(
                    movie: controller.favoriteMovies[i],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
