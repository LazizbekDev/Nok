import 'package:flutter/material.dart';
import 'package:nok/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'package:nok/widgets/button.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurant = Provider.of<Restaurant>(context);
    final cartItems = restaurant.cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Your cart is empty!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            item.food.imagePath,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(item.food.name),
                          subtitle: Text(
                            "Quantity: ${item.quantity}  |  Price: \$${(item.food.price * item.quantity).toStringAsFixed(2)}",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () {
                                  restaurant.removeFromCart(item.food, item.selectedAddons);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  restaurant.addToCart(item.food, item.selectedAddons);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Total: \$${restaurant.getTotalPrice().toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Button(
                        onTap: () {
                          // Handle checkout action
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Proceeding to checkout...")),
                          );
                        },
                        text: "Checkout",
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
