import 'dart:convert';

import 'package:tmdb_api/tmdb_api.dart';
import '../constant/api_variables.dart';
import 'package:http/http.dart' as http;

class TmdpAPI {
  TMDB tmdb = TMDB(
    ApiKeys(apiKey, readAccessToken),
    logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    // defaultLanguage: "ar",
  );

  Future<Map<dynamic, dynamic>> get trending async =>
      await tmdb.v3.trending.getTrending();

  Future<Map<dynamic, dynamic>> get nowPlaying async =>
      await tmdb.v3.movies.getNowPlaying();

  Future<Map<dynamic, dynamic>> get upcoming async =>
      await tmdb.v3.movies.getUpcoming();

  Future<Map<dynamic, dynamic>> get genres async =>
      await tmdb.v3.genres.getMovieList();

  Future<Map<dynamic, dynamic>> moviesByGenres(String genres) async {
    if (genres == "0") {
      genres = "";
    }
    var res = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=$genres"));
    return jsonDecode(res.body);
  }

  Future<Map<dynamic, dynamic>> findByID(String id) {
    return tmdb.v3.find.getById(id);
  }
}
