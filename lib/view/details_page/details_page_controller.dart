import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/view/home_page/home_page_controller.dart';

import '../../services.dart';

class DetailsPageController extends GetxController {
  List<String> genresName = [];
  movieModel? movie;
  List? genres;
  bool isFavorite = false;
  bool isLoading = true;
  updateIsLoading() {
    isLoading = !isLoading;
    update();
  }

  pop() {
    Get.offAllNamed(Get.previousRoute);
  }

  getMovieGenresName() {
    int j = 0;
    for (int i = 0; i < genres!.length; i++) {
      if (genres![i]["id"] == movie!.genreIds![j]) {
        genresName.add(genres![i]["name"]);
        j++;
        i = 0;
      }
      if (j == movie!.genreIds!.length) {
        break;
      }
    }
  }

  addToFavorite() {
    String movieString = jsonEncode(movie);
    MyServices services = Get.find();
    if (services.sharedPreferences.getStringList("favoriteMovies") != null) {
      List<String> favoriteMovies =
          services.sharedPreferences.getStringList("favoriteMovies")!;
      favoriteMovies.add(movieString);
      services.sharedPreferences
          .setStringList("favoriteMovies", favoriteMovies);
    } else {
      services.sharedPreferences.setStringList("favoriteMovies", [movieString]);
    }
    isFavorite = true;
    update();
  }

  removeFromFavorite() {
    List<movieModel> favoriteMovies = [];

    MyServices services = Get.find();
    List<String>? tempList =
        services.sharedPreferences.getStringList("favoriteMovies");

    for (var element in tempList!) {
      favoriteMovies.add(movieModel.fromJson(jsonDecode(element)));
    }
    for (int i = 0; i < favoriteMovies.length; i++) {
      if (movie!.id == favoriteMovies[i].id) {
        print("djasodisjdoasjmdioasjd");
        favoriteMovies.removeAt(i);
      }
    }
    List<String> stringList = [];
    for (var element in favoriteMovies) {
      stringList.add(jsonEncode(element));
    }
    services.sharedPreferences.clear();
    services.sharedPreferences.setStringList("favoriteMovies", stringList);
    isFavorite = false;
    update();
  }

  isMovieFavorite() {
    List<movieModel> favoriteMovies = [];
    favoriteMovies.clear();
    MyServices services = Get.find();
    List<String>? tempList =
        services.sharedPreferences.getStringList("favoriteMovies");

    if (tempList != null) {
      for (var element in tempList) {
        favoriteMovies.add(movieModel.fromJson(jsonDecode(element)));
      }
    }

    for (var element in favoriteMovies) {
      if (element.id == movie!.id) {
        isFavorite = true;
      }
    }
    update();
  }

  @override
  void onInit() async {
    movie = Get.arguments;
    HomePageController controller = Get.put(HomePageController());
    genres = await controller.getGenres();
    await getMovieGenresName();
    await isMovieFavorite();
    updateIsLoading();
    super.onInit();
  }
}
