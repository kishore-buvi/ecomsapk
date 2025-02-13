import 'package:flutter/material.dart';


class ImageSliders extends StatelessWidget {
  Function(int) onchanged;
  String image;
  ImageSliders({super.key,required this.image,required this.onchanged});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 300,
      width: double.infinity,
      child: PageView.builder(itemBuilder:(context,index){
        return Image.asset(image);
      } ),
    );

  }
}