import 'package:flutter/material.dart';


// ignore: must_be_immutable
class PageViewWidget extends StatelessWidget {
   PageViewWidget({required this.image,super.key});

  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: 
        AssetImage(image))
      ),
    );
  }
}