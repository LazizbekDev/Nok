import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    final secondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 50),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  '\$0.99',
                  style: primaryTextStyle,
                ),
                Text(
                  'Delivery fee',
                  style: secondaryTextStyle,
                ),
              ],
            ),
            Column(children: [
              Text(
                '15-30 min',
                style: primaryTextStyle,
              ),
              Text(
                'Delivery time',
                style: secondaryTextStyle,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
