import 'package:ecomsapk/Screens/details/image_slider.dart';
import 'package:ecomsapk/constants.dart';
import 'package:ecomsapk/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:ecomsapk/Screens/details/detailAppBar.dart';
import 'package:ecomsapk/Screens/home/Widget/Product_cart.dart';
import 'package:ecomsapk/Screens/details/detail_contentdsr.dart';
import 'package:ecomsapk/Screens/details/detailscreen.dart';
import '../../Provider/favouriteProvider.dart';

import 'addCart.dart';
class DetailScreen extends StatefulWidget {
  Product product;
  DetailScreen({super.key,required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage=0;
  int currentBar=0;


  @override
  Widget build(BuildContext context) {
    final provider=FavouriteProvider.of(context);
    return Scaffold(
      floatingActionButton: AddCart(product: widget.product,),
      backgroundColor: kcontentColor,
      body: SafeArea(child:
      SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailAppBar(product: widget.product,),
            ImageSliders(image: widget.product.image, onchanged: (index){
              setState(() {
                currentImage=index;
              });
            }),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: currentImage == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentImage == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.all(10.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.title,style: TextStyle(fontSize: 40,fontWeight: FontWeight.w400),),
        
                  Text("\$${widget.product.price.toString()}",style: TextStyle(fontSize: 25),),
                  Align(alignment: Alignment.topRight,child: Text('Seller: ${widget.product.seller}',
                    style: TextStyle(fontSize: 18,),)),
                  Row(
                    children: [
                      Container(
                        height: 25,width: 50,
                        decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: [
                            Icon(Icons.star,color: Colors.white,),
                      
                            Text(widget.product.rate.toString(),style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold),),
                      
                      
                          ],
                        ),
                        
                      ),
                      SizedBox(width: 10,),
                      Text('(${widget.product.review}),',style:TextStyle(fontSize: 16),)
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text('Color',style: TextStyle(fontSize: 20),),
                  Row(
                    children:
                    List.generate(widget.product.colors.length,
                          (index)  => Container(
                        height: 18,
                        width: 18,
                        margin: EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(border:Border.all(color: Colors.black,width: 0.7),
                            color:widget.product.colors[index],
                            shape: BoxShape.circle
        
                        ),
                        ),
                      ),
                    ),
        
        
                ],
              ),
            ),
        
        SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
              DetailedDescriptionContainer(boxTitle: 'Description',onPressedd:()=> setState(() {
                currentBar=0;
              })),
              DetailedDescriptionContainer(boxTitle: 'Specification',onPressedd: ()=>setState(() {
                currentBar=1;
              })),
              DetailedDescriptionContainer(boxTitle: 'Review',onPressedd: ()=>setState(() {
                currentBar=2;
              })),



            ],),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(currentBar==0?widget.product.description:currentBar==1?
                      widget.product.seller:widget.product.review,softWrap: true,overflow: TextOverflow.clip,),
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      )),
    );
  }
}

