import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/view/home_page/home_page_controller.dart';
import 'package:movie_app/view/home_page/widgets/custom_image_cart.dart';

class CustomListView extends StatelessWidget {
  final int itemCont;
  final List<movieModel> list;
  const CustomListView({super.key, required this.itemCont, required this.list});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find();
    return SizedBox(
      height: MediaQuery.of(context).size.width / 2.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: itemCont,
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            controller.goToDetilPage(list[i]);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CustomImageCard(
              imgURL: list[i].posterPath!,
            ),
          ),
        ),
      ),
    );
  }
}
