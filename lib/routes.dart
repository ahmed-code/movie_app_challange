import 'package:get/get.dart';
import 'package:movie_app/view/details_page/details_page.dart';
import 'package:movie_app/view/main_page/main_page.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: "/", page: () => const MainPage()),
  GetPage(name: "/detailsPage", page: () => const DetailsPage()),
];
