import 'package:flutter/material.dart';
import 'package:nok/routes/route_names.dart';
import 'package:nok/widgets/sidebar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const Sidebar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is Home directory'),
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.signIn);
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
