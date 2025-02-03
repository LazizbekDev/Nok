import 'package:flutter/material.dart';
import 'package:nok/models/food.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.tabController});
  final TabController tabController;

  List<Tab> _buildCategory() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split(".").last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: _buildCategory(),
    );
  }
}
