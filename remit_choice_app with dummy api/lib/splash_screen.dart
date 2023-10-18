// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization tasks or logic here
    _navigateToNextScreen(); // Navigates to the next screen after a delay
  }

  void _navigateToNextScreen() async {
    // Simulate a delay before navigating to the next screen
    await Future.delayed(
        const Duration(seconds: 5)); // Adjust the duration as needed

    // Navigate to the next screen, such as your home screen
    Navigator.pushReplacementNamed(
        context, '/login'); // Replace with your route name
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange, // Set the background color to orange
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo1.png', // Path to your local logo image
              width: 250, // Set the desired width
              height: 250, // Set the desired height
            ),
            const SizedBox(height: 20),
            // Add any additional widgets or UI elements here
          ],
        ),
      ),
    );
  }
}
