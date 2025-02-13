import 'package:flutter/material.dart';
class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 19,right: 19),
      child: Container(height: 55,width: double.infinity,decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),child: Row(
          children: [Icon(Icons.search,color: Colors.grey,size: 30,),SizedBox(width: 10,),
          Flexible(flex: 4,child:TextField(
            decoration: InputDecoration(
              hintText: 'search',border: InputBorder.none
            ),
          ) ,),Container(
              height: 25,width: 1.5,color: Colors.grey,
            ),
          IconButton(onPressed: (){}, icon: Icon(Icons.tune),color: Colors.grey,)],
      ),),
    );
  }
}
