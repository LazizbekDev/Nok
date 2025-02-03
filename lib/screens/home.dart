import 'package:flutter/material.dart';
import 'package:nok/widgets/description.dart';
import 'package:nok/widgets/location_info.dart';
import 'package:nok/widgets/sidebar.dart';
import 'package:nok/widgets/sliver_bar.dart';
import 'package:nok/widgets/top_bar.dart';

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

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text('Home $index'),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text('Settings $index'),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text('Profile $index'),
            ),
          ],
        ),
      ),
    );
  }
}
