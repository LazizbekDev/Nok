import 'package:flutter/material.dart';
import 'package:nok/widgets/tile.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Tile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () {},
          ),
          Tile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {},
          ),
          const Spacer(),
          Tile(
            text: "L O G O U T",
            icon: Icons.logout_outlined,
            onTap: () {},
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
