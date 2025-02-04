import 'package:flutter/material.dart';
import 'package:nok/routes/route_names.dart';

class SliverBar extends StatelessWidget {
  const SliverBar({super.key, required this.child, required this.title});
  final Widget child;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, RouteNames.cart),
          icon: const Icon(Icons.shopping_cart),
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: const Text('Sunset Dinner'),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: title,
        centerTitle: true,
        expandedTitleScale: 1,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
      ),
    );
  }
}
