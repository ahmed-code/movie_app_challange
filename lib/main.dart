import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/constant/app_colors.dart';
import 'package:movie_app/routes.dart';
import 'package:movie_app/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        canvasColor: AppColors.primary,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
          displayMedium: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      getPages: getPages,
    );
  }
}
