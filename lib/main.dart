import 'package:ecomsapk/Provider/cart_Provider.dart';
import 'package:ecomsapk/Provider/favouriteProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecomsapk/Screens/nav_bar_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(MultiProvider(
    providers: [ 
      ChangeNotifierProvider(create: (_)=>CartProvider()),
      ChangeNotifierProvider(create: (context)=>FavouriteProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:GoogleFonts.mulishTextTheme(),
      ),
      home: MyApp(),
    ),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NavBarScreen(

    ) ;
  }
}
