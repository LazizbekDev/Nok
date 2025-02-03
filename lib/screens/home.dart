import 'package:flutter/material.dart';
import 'package:nok/models/food.dart';
import 'package:nok/models/restourant.dart';
import 'package:nok/widgets/description.dart';
import 'package:nok/widgets/food_list_tile.dart';
import 'package:nok/widgets/location_info.dart';
import 'package:nok/widgets/sidebar.dart';
import 'package:nok/widgets/sliver_bar.dart';
import 'package:nok/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  List<Food> _filterMenu(FoodCategory category, List<Food> menu) {
    return menu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodByCategory(List<Food> menu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenu(category, menu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return FoodListTile(
            name: categoryMenu[index].name,
            description: categoryMenu[index].description,
            imageUrl: categoryMenu[index].imagePath,
            price: categoryMenu[index].price,
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverBar(
                  title: TopBar(tabController: _tabController),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const LocationInfo(),
                      const Description(),
                    ],
                  ),
                )
              ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
              controller: _tabController,
              children: getFoodByCategory(restaurant.menu),
            ),
          )),
    );
  }
}
