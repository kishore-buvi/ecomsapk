import 'package:ecomsapk/Provider/favouriteProvider.dart';
import 'package:ecomsapk/Screens/details/detailscreen.dart';
import 'package:flutter/material.dart';
import 'package:ecomsapk/constants.dart';
import 'package:ecomsapk/models/product_model.dart';

class ProductCart extends StatelessWidget {
  final Product product;

  const ProductCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavouriteProvider.of(context, listen: true);
    final isFav = provider.isExist(product);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(product: product),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kcontentColor,
          border: Border.all(color: Colors.grey.shade300, width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          product.colors.length,
                              (index) => Container(
                            height: 16,
                            width: 16,
                            margin: const EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(
                              color: product.colors[index],
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 1.5),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  provider.toogleFavourite(product);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : Colors.grey,
                      size: 24,
                    ),
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
