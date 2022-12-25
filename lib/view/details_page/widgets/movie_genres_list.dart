import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movie_app/constant/app_colors.dart';
import 'package:movie_app/view/details_page/details_page_controller.dart';

class MovieGenresList extends StatelessWidget {
  const MovieGenresList({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsPageController controller = Get.find();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.genresName.length,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.customDark,
        ),
        child: Text(
          controller.genresName[index],
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
