import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/cart_Provider.dart';
import '../../constants.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, child) {
        final cartItems = provider.cart;

        return Container(
          height: MediaQuery.of(context).size.height * 0.6, // Adjust height dynamically
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded( // 🔥 Wrap with Expanded to make it scrollable
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: Image.asset(
                          item.image,
                          width: 50,
                          height: 50,
                        ),
                        title: Text(
                          item.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            provider.removeFromCart(item);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$${provider.totalPrice().toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kprimaryColor,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Check Out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );

      },
    );
  }
}
