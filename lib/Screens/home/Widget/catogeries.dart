import 'package:flutter/material.dart';
import 'package:ecomsapk/models/category.dart';


class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> images = [
    'images/download (1).jpg',
    'images/download (2).jpg',
    'images/download (3).jpg',
    'images/download (4).jpg',

  ];
  int selectIndex=0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130, // Adjust height for visibility
      child: ListView.builder(scrollDirection: Axis.horizontal,
        itemCount:categories.length,
        itemBuilder: (context, int index) {
          return GestureDetector(onTap: (){
setState(() {
  selectIndex=index;
});
          },
            child: Container(
padding: EdgeInsets.all(5),
              color: selectIndex==index?Colors.blue:Colors.transparent,
              child: Column(
                children: [

                  Container(
                    height: 65,
                    width: 65,
                    decoration:BoxDecoration( shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(categories[index].image,),
                            fit: BoxFit.cover)),
                  )
                  ,SizedBox(height: 5,),Text(categories[index].title,
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          );
        }, ),

    );
  }
}
