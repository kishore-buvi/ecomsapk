import 'package:ecomsapk/constants.dart';
import 'package:flutter/material.dart';
import '../../Provider/favouriteProvider.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    final provider = FavouriteProvider.of(context, listen: true);
    final finalList = provider.favourite;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcontentColor,
        title: const Text(
          'Favourite',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: finalList.isEmpty
          ? const Center(
        child: Text(
          "No favourite items yet!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      )
          : ListView.builder(
        itemCount: finalList.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final cartItem = finalList[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  // Product Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      cartItem.image,
                      height: 85,
                      width: 85,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Product Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          cartItem.category,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "\$${cartItem.price}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Delete Button
                  GestureDetector(
                    onTap: () {
                      provider.toogleFavourite(cartItem); // Remove item
                    },
                    child: const Icon(Icons.delete, size: 28, color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
