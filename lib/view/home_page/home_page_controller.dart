import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/constant/app_colors.dart';
import 'package:movie_app/data/lmdpAPI.dart';
import 'package:movie_app/data/models/movie_model.dart';

class HomePageController extends GetxController {
  bool isLoading = true;
  List<movieModel> nowPlaying = [];
  List<movieModel> trending = [];
  List<movieModel> upcoming = [];
  List<movieModel> moviesByGenre = [];
  List<dynamic> genres = [];
  int selectedGenres = 0;
  int selectedBarIndex = 0;

  goToDetilPage(movieModel movie) {
    Get.offAllNamed("/detailsPage", arguments: movie);
  }

  updateSelectedBarIndex(int val) {
    selectedBarIndex = val;
    update();
  }

  updateSelectedGenres(int val) {
    selectedGenres = val;
    getMovieByGenres();
    update();
  }

  updateLoading() {
    isLoading = !isLoading;
    update();
  }

  Future<List> getGenres() async {
    TmdpAPI tmdp = TmdpAPI();
    Map tempData;
    tempData = await tmdp.genres;
    List<dynamic> tempGenres = tempData['genres'];

    tempGenres.insert(0, {"id": 0, "name": "all"});
    return tempGenres;
  }

  getMovieByGenres() async {
    TmdpAPI tmdp = TmdpAPI();
    Map data;
    moviesByGenre.clear();

    data = await tmdp.moviesByGenres(selectedGenres.toString());
    for (var element in data["results"]) {
      moviesByGenre.add(movieModel.fromJson(element as Map<String, dynamic>));
    }
    update();
  }

  getMovies() async {
    TmdpAPI tmdp = TmdpAPI();
    Map data;

    data = await tmdp.nowPlaying;
    for (var element in data["results"]) {
      nowPlaying.add(movieModel.fromJson(element as Map<String, dynamic>));
    }

    data = await tmdp.trending;
    for (var element in data["results"]) {
      trending.add(movieModel.fromJson(element as Map<String, dynamic>));
    }

    data = await tmdp.upcoming;
    for (var element in data["results"]) {
      upcoming.add(movieModel.fromJson(element as Map<String, dynamic>));
    }
    await getMovieByGenres();
  }

  @override
  void onInit() async {
    // TODO: implement onInit

    genres = await getGenres();
    await getMovies();
    updateLoading();

    super.onInit();
  }
}
