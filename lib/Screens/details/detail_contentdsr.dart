import 'package:flutter/material.dart';
class DetailedDescriptionContainer extends StatelessWidget {
  String boxTitle;
  VoidCallback onPressedd;

  DetailedDescriptionContainer({required this.boxTitle,required this.onPressedd,});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressedd,
      child: Container(height: 40,alignment: Alignment.center,
        width: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(
            Radius.circular(25)
        ),
          color:Colors.orange ,

        ),

        child: Text(boxTitle,style: TextStyle(color: Colors.white)),


      ),
    );
  }
}