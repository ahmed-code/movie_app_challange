import 'package:flutter/cupertino.dart';
import 'package:movie_app/constant/api_variables.dart';

class CustomImageCard extends StatelessWidget {
  final String imgURL;
  const CustomImageCard({super.key, required this.imgURL});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.network(imagePath + imgURL),
    );
  }
}
