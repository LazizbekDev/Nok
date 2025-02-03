class Food {
  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });

  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddons;
}

enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

class Addon {
  Addon({required this.name, required this.price});
  final String name;
  final double price;
}
