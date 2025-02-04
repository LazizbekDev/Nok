import 'package:flutter/material.dart';
import 'package:nok/models/cart_item.dart';
import 'package:nok/models/food.dart';
import 'package:collection/collection.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    Food(
      name: "Classic Cheeseburger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/hamburgers/burger1.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "King Cheeseburger",
      description:
          "The juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle. lorem",
      imagePath: "assets/images/hamburgers/burger2.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Modern Cheeseburger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/hamburgers/burger3.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "the juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/hamburgers/burger4.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Historical Cheeseburger",
      description:
          "An oily beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/hamburgers/burger5.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),

    // salads

    Food(
      name: "Hot salad",
      description:
          "An oily beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/salads/salad1.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Wet salad",
      description:
          "An oily beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/salads/salad2.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Juicy salad",
      description:
          "An oily beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/salads/salad5.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),

    // pizza

    Food(
      name: "cheese pizza",
      description:
          "cheese beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/pizza/pizza1.png",
      price: 0.99,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "melt pizza",
      description:
          "cheese beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/pizza/pizza4.png",
      price: 0.99,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Chocolate pizza",
      description:
          "cheese beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/pizza/pizza3.png",
      price: 0.99,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),

    // desserts
    // drinks
    Food(
      name: "Chocolate milkshake",
      description:
          "cheese beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/drinks/drink1.jpg",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Pinky milkshake",
      description:
          "cheese beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/drinks/drink2.jpg",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Adeline milkshake",
      description:
          "cheese beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "assets/images/drinks/drink3.jpg",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
  ];
  final List<CartItem> _cart = [];

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  void addToCart(Food food, List<Addon> selectedAddons) {
    try {
      CartItem cartItem = _cart.firstWhere(
        (item) {
          bool sameFood = item.food == food;
          bool sameAddon =
              const ListEquality().equals(item.selectedAddons, selectedAddons);
          return sameFood && sameAddon;
        },
      );

      cartItem.quantity++;
    } catch (e) {
      _cart.add(
          CartItem(food: food, selectedAddons: selectedAddons, quantity: 1));
    }
    notifyListeners();
  }

  void removeFromCart(Food food, List<Addon> selectedAddons) {
    try {
      CartItem? cartItem = _cart.firstWhereOrNull(
        (item) =>
            item.food == food &&
            const ListEquality().equals(item.selectedAddons, selectedAddons),
      );

      if (cartItem != null) {
        if (cartItem.quantity > 1) {
          cartItem.quantity--;
        } else {
          _cart.remove(cartItem);
        }
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem item in _cart) {
      double itemTotal = item.food.price;

      for (Addon addon in item.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * item.quantity;
    }

    return total;
  }

  int getTotalItemCount() {
    int totalCount = 0;

    for (CartItem item in _cart) {
      totalCount += item.quantity;
    }

    return totalCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
