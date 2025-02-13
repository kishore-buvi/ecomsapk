import 'package:ecomsapk/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:ecomsapk/constants.dart';

import '../../Provider/favouriteProvider.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;

  const DetailAppBar({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    final provider=FavouriteProvider.of(context);
    return Padding(padding: EdgeInsets.all(10),
    child:  Row(children: [
      IconButton(style: IconButton.styleFrom(backgroundColor: kcontentColor,
          padding:EdgeInsets.all(15)),
          onPressed: (){
        Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios)),
      Spacer(),
      IconButton(style: IconButton.styleFrom(backgroundColor: kcontentColor,
          padding:EdgeInsets.all(15)),
          onPressed: (){},
          icon: Icon(Icons.share_outlined)),
      SizedBox(width: 10,),
      IconButton(style: IconButton.styleFrom(backgroundColor: kcontentColor,
          padding:EdgeInsets.all(15)),
          onPressed: (){
        provider.toogleFavourite(product);
          },
          icon: Icon(provider.isExist(product)?Icons.favorite:Icons.favorite_outline_rounded,color: Colors.black,
          size: 25,))

    ],),);
  }
}
