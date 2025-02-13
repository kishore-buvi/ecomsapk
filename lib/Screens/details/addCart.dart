import 'package:ecomsapk/Provider/cart_Provider.dart';
import 'package:ecomsapk/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCart extends StatefulWidget {
  final Product product;
  const AddCart({super.key,required this.product});

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  int count=1;
  @override

  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: true);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.black,
        ),
        alignment: Alignment.center, // Centering content
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Aligning content properly
          children: [
            SizedBox(width: 1),
            // Quantity Selector
            Container(
              height: 40,
              width: 100,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(child: Icon(Icons.remove, color: Colors.white),onTap: (){
                      if(count !=1){
                        setState(() {
                          count--;
                        });
                      }
                }),
                  SizedBox(width: 1,),
                  Text(count.toString(), style: TextStyle(color: Colors.white)),
                  SizedBox(width: 1,),
                  GestureDetector(child: Icon(Icons.add, color: Colors.white),onLongPress:()=>setState(() {
                    count++;
                  }) ,
                    onTap: (){if(count !=1){
      setState(() {
      count++;
      });
      }}),
                ],
              ),
            ),
            SizedBox(width: 20),
            // Add to Cart Button
            GestureDetector(

                onTap: () {
                  provider.toogleFavourite(widget.product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Successfully added",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                      ),
                      backgroundColor: Colors.green, // Optional: Change the background color
                      duration: Duration(seconds: 2), // Optional: Control how long it appears
                    ),
                  );
                },

              child: Container(
                width: 160,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.orange,
                ),
                child: Center(
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
