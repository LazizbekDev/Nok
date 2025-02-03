import 'package:flutter/material.dart';
import 'package:nok/routes/route_names.dart';
import 'package:nok/widgets/button.dart';
import 'package:nok/widgets/input_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Color passwordBorderColor = Colors.grey; // Default border color
  Color confirmPasswordBorderColor = Colors.grey;

  void validateConfirmPassword() {
    setState(() {
      if (confirmPasswordController.text.isNotEmpty &&
          passwordController.text == confirmPasswordController.text) {
        confirmPasswordBorderColor = Theme.of(context).colorScheme.tertiary; // Valid color
      } else {
        confirmPasswordBorderColor = const Color(0xFFFC7D74); // Error color
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                'Food Delivery App',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            InputField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InputField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                borderColor: Theme.of(context).colorScheme.tertiary, // Default color for password
              ),
            ),
            InputField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: true,
              borderColor: confirmPasswordBorderColor, // Use dynamic border color
              onChanged: (_) => validateConfirmPassword(),
            ),
            const SizedBox(
              height: 10,
            ),
            Button(
              onTap: () {
                validateConfirmPassword();
                if (confirmPasswordBorderColor ==
                    Theme.of(context).colorScheme.tertiary) {
                  // Proceed with registration logic
                  debugPrint('Passwords match. Proceeding...');
                } else {
                  debugPrint('Passwords do not match.');
                }
              },
              text: 'Sign Up',
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.signIn);
                  },
                  child: Text(
                    'Sign in here',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
