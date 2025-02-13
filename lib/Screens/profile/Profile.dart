import 'package:flutter/material.dart';
class Profiles extends StatelessWidget {
  const Profiles({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
body: Stack(
  children: [
    Image.asset("images/314029579_1206911950237011_5727666058274012932_n.jpg",fit: BoxFit.cover,
    height: size.height,
    width: size.width,),
    Padding(padding: EdgeInsets.symmetric(horizontal: 9,vertical: 20),child: Align(alignment: Alignment.bottomCenter,
    child: Card(shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),

    ),child: Container(height: size.height*0.4,
    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 15,
    ),
    child: SingleChildScrollView(
      child: Column(
        children: [Padding(padding: EdgeInsets.symmetric(horizontal: 15),child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Stack(
            children: [
              CircleAvatar(radius: 42,backgroundImage: AssetImage("images/68528654_911026925943329_3212097919171690496_n.jpg"),
              ),
              Positioned(
                bottom: 0,
                right: 0 ,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 95, 225, 99)
                  ),
                  child: Icon(Icons.check,color: Colors.white,
                  size: 20,),
                ),
              )
            ],
          ),Row(
      
            children: [Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black)),
              padding: EdgeInsets.symmetric(vertical: 9,horizontal: 12),
              child: Text("Add Friends",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),),
            ),
            SizedBox(width: 8,),
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      color: Colors.pink),padding: EdgeInsets.symmetric(
      vertical: 8,horizontal: 12
      ),
      child: Text("follow",style: TextStyle(fontWeight: FontWeight.bold,
      fontSize: 16,color: Colors.white),),)
            ,],
      
          ),],),
            SizedBox(height: 5,),
            Text('Kishore Shanmugam',style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 35,color: Colors.black),),
      
            Text('flutter developer',style: TextStyle(
                fontSize: 19,color: Colors.black),),
            Divider(color: Colors.black,),
      
            Text("A Flutter developer uses Flutter – a popular open-source framework by Google –"
                " to create cross-platform mobile applications.developers can deliver high-quality,"
                " visually appealing applications that can  boost a company's mobile presence.",
              style: TextStyle(
                fontSize: 15,color: Colors.black),),
      
      ],
        ),),
      
        ],
      ),
    ),),),),)

  ],
),

    );
  }
}
