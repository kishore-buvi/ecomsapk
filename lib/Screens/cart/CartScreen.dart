import 'package:ecomsapk/Provider/cart_Provider.dart';
import 'package:ecomsapk/Screens/cart/check_out.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottomNavBar.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;

    // Function for quantity buttons
    Widget ProductQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQtn(index)
                : provider.decQtn(index);
          });
        },
        child: Icon(icon, size: 20),
      );
    }

    return Scaffold(
      bottomSheet: CheckOut(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavBar()),
                      );
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(15),
                    ),
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(width: 105),
                  Align(
                    child: Text(
                      'My Cart',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  final cartItem = finalList[index];

                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          // Product Image
                          Container(
                            height: 100,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Image.asset(cartItem.image),
                          ),
                          SizedBox(width: 10),

                          // Product Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItem.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  cartItem.category,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "\$${cartItem.price}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Delete & Quantity Control
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {

                                  });
                                },
                                child: Icon(Icons.delete, size: 30, color: Colors.red),
                              ),
                              SizedBox(height: 6),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  border: Border.all(color: Colors.black, width: 2),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ProductQuantity(Icons.remove, index),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        cartItem.quantity.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    ProductQuantity(Icons.add, index),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
