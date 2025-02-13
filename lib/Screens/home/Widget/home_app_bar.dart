import 'package:flutter/material.dart';
import 'package:ecomsapk/constants.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [IconButton(style: IconButton.styleFrom(backgroundColor: kcontentColor,
            padding:EdgeInsets.all(20)),
            onPressed: (){},
            icon: Icon(Icons.notifications,)),IconButton(style: IconButton.styleFrom(backgroundColor: kcontentColor,
            padding:EdgeInsets.all(20)),
            onPressed: (){},
            icon: Image.asset('images/four-circle.png',height: 20,)),]
    );
  }
}
