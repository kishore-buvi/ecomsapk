import 'package:ecomsapk/Screens/cart/CartScreen.dart';
import 'package:ecomsapk/Screens/home/home_screen.dart';
import 'package:ecomsapk/Screens/profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:ecomsapk/constants.dart';
import '../Screens/favourite/favourite.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currenIndex = 2; // Set HomeScreen as the default page

  List<Widget> screens = [
    Scaffold(), // Placeholder for future feature
    Favourite(),
    HomeScreen(),
    cartScreen(),
    Profiles(), // Placeholder for profile or other feature
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currenIndex = 2; // Navigate to HomeScreen
          });
        },
        shape: CircleBorder(),
        backgroundColor: kprimaryColor,
        child: Icon(Icons.home, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 1,
        height: 60,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.grid_view_outlined,
                size: 26,
                color: currenIndex == 2 ? kprimaryColor : Colors.grey.shade400,
              ),
              onPressed: () {
                setState(() {
                  currenIndex = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: 26,
                color: currenIndex == 1 ? kprimaryColor : Colors.grey.shade400,
              ),
              onPressed: () {
                setState(() {
                  currenIndex = 1;
                });
              },
            ),
            SizedBox(width: 40), // Space for FAB
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 26,
                color: currenIndex == 3 ? kprimaryColor : Colors.grey.shade400,
              ),
              onPressed: () {
                setState(() {
                  currenIndex = 3;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                size: 26,
                color: currenIndex == 4 ? kprimaryColor : Colors.grey.shade400,
              ),
              onPressed: () {
                setState(() {
                  currenIndex = 4;
                });
              },
            ),
          ],
        ),
      ),
      body: screens[currenIndex],
    );
  }
}
