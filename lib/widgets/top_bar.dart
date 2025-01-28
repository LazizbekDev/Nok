import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final TabController tabController;
  const TopBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: const [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.settings),
          ),
          Tab(
            icon: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
