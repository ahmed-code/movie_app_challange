import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/services.dart';

class FavoritePageController extends GetxController {
  List<movieModel> favoriteMovies = [];

  List<movieModel> getFavoriteMovies() {
    favoriteMovies.clear();
    MyServices services = Get.find();
    List<String>? tempList =
        services.sharedPreferences.getStringList("favoriteMovies");

    if (tempList != null) {
      for (var element in tempList) {
        favoriteMovies.add(movieModel.fromJson(jsonDecode(element)));
      }
    }
    return favoriteMovies;
  }

  goToDetailsPage(movieModel movie) {
    Get.offNamed("/detailsPage", arguments: movie);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getFavoriteMovies();
    super.onInit();
  }
}
