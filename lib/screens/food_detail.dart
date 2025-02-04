import 'package:flutter/material.dart';
import 'package:nok/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'package:nok/models/food.dart';
import 'package:nok/widgets/button.dart';

class FoodDetail extends StatefulWidget {
  FoodDetail({super.key, required this.food}) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  void _addToCart() {
    final restaurant = Provider.of<Restaurant>(context, listen: false);

    // Get selected addons
    List<Addon> selectedAddonsList = widget.selectedAddons.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    // Add item to cart
    try {
      restaurant.addToCart(widget.food, selectedAddonsList);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${widget.food.name} added to cart!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error adding to cart: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(widget.food.imagePath),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.food.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '\$${widget.food.price.toString()}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(widget.food.description),
                            ),
                            Divider(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            Text(
                              "Add-ons",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.food.availableAddons.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  Addon addon = widget.food.availableAddons[index];

                                  return CheckboxListTile(
                                    title: Text(addon.name),
                                    subtitle: Text(
                                      '\$${addon.price.toString()}',
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                                    value: widget.selectedAddons[addon],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        widget.selectedAddons[addon] = value!;
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Button(
                  onTap: _addToCart,
                  text: "Add to Cart",
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.7,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_rounded),
              ),
            ),
          ),
        )
      ],
    );
  }
}
