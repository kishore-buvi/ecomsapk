import 'package:ecomsapk/Screens/home/Widget/catogeries.dart';
import 'package:ecomsapk/constants.dart';
import 'package:flutter/material.dart';
import 'package:ecomsapk/Screens/home/Widget/home_app_bar.dart';
import 'package:ecomsapk/Screens/home/Widget/search_bar.dart';
import 'package:ecomsapk/Screens/home/Widget/Image_slider.dart';
import 'package:ecomsapk/models/product_model.dart';
import 'package:ecomsapk/Screens/home/Widget/Product_cart.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider=0;
  int SelectedIndex=0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCatogeries=[products];
    return Scaffold(body: SingleChildScrollView(
      child: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAppBar(),
            MySearchBar(),
            Container(padding: EdgeInsets.all(13),decoration:BoxDecoration(borderRadius: BorderRadius.circular(20))
                ,child: ImageSlider(currentSlide: currentSlider, onChange: (value )
                {
                  setState(() {
                    currentSlider=value;
                  });
                },)),
            SizedBox(height: 20,),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 7),
                child: Categories(),
              ),
            ),
           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             Text('Special For you',style: TextStyle(fontWeight: FontWeight.w800,
             fontSize: 25),),
             Text('See All',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
             SizedBox(),

           ],),
                SingleChildScrollView(
                  child: GridView.builder(   physics:  NeverScrollableScrollPhysics(),
                    shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,),



                   itemCount:selectedCatogeries[SelectedIndex].length ,itemBuilder: (context,index) {
                  return ProductCart(product: selectedCatogeries[SelectedIndex][index],);
                  },),
                ),
          ],
        ),
      ),
    ));
  }
}

