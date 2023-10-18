import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remit_choice_app/splash_screen.dart';

import 'AuthenticationProvider/AuthenticationProvider.dart';
import 'startup_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set your initial route here
      routes: {
        '/': (context) =>
            const SplashScreen(), // Define your SplashScreen route
        '/login': (context) =>
            const StartupPage(), // Define your LoginPage route
        // Add other routes as needed
      },
    );
  }
}
