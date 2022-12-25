import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/view/favorite_page/favorite_page.dart';
import 'package:movie_app/view/home_page/home_page.dart';

class MainPageController extends GetxController {
  int selectedBarIndex = 0;
  List<Widget> pages = [
    HomePage(),
    FavoritePage(),
  ];
  updateSelectedBarIndex(int val) {
    selectedBarIndex = val;
    update();
  }
}
