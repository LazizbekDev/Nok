import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DeliveryProgressScreen extends StatefulWidget {
  const DeliveryProgressScreen({super.key});

  @override
  State<DeliveryProgressScreen> createState() => _DeliveryProgressScreenState();
}

class _DeliveryProgressScreenState extends State<DeliveryProgressScreen> {
  double progress = 0.0;
  bool isDelivered = false;

  @override
  void initState() {
    super.initState();
    _startDeliveryProgress();
  }

  void _startDeliveryProgress() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => progress = 0.3);
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() => progress = 0.6);
    });
    Future.delayed(const Duration(seconds: 5), () {
      setState(() => progress = 1.0);
    });
    Future.delayed(const Duration(seconds: 12), () {
      setState(() => isDelivered = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Delivery Progress")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isDelivered) ...[
              Lottie.asset('assets/animations/delivery.json', height: 200),
              const SizedBox(height: 20),
              const Text(
                "Your order is on the way!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(value: progress),
              const SizedBox(height: 10),
              const Text(
                "Estimated Time: 5-10 min",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ] else ...[
              Lottie.asset('assets/animations/done.json', height: 200),
              const SizedBox(height: 20),
              const Text(
                "Your order has been delivered! 🎉",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Back to Home"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
