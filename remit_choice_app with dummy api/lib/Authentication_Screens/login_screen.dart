// ignore_for_file: unused_import, avoid_print, use_build_context_synchronously, unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:remit_choice_app/Authentication_Screens/registration.dart';

import '../homeScren/homepage.dart';
import 'Home_Screen.dart/home_screen.dart';
import 'apiClient.dart';
import 'package:http/http.dart' as http; // For making HTTP requests

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  late final String accesstoken;
  // Add this line
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Add this line
  final ApiClient _apiClient = ApiClient();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.orange,
                      ),
                    ),
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (selectedLanguage) {
                        // ==============================Handle language selection here
                        print('Selected language: $selectedLanguage');
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          _buildLanguageOption('German', 'assets/germany.png'),
                          _buildLanguageOption('UK', 'assets/uk.png'),
                          _buildLanguageOption('USA', 'assets/usa.png'),
                          _buildLanguageOption(
                              'Australian', 'assets/australia.png'),
                          _buildLanguageOption('Italy', 'assets/italy.png'),
                        ];
                      },
                      icon: const Icon(
                        Icons.language,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 80,
                    width: 80,
                  ),
                ],
              ),
              // ======================================Input Fields
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    isDense: true,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),

              // ======================================Forgot password and Sign Up Now buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle Forgot Password
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 10), // =========Adding space between buttons
                    TextButton(
                      onPressed: () {
                        // Handle Sign Up Now
                      },
                      child: const Text(
                        "Sign Up Now",
                        style: TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//================================================Login Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, proceed with login logic
                      login(emailController.text.toString(),
                          passwordController.text.toString());
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text('Login'),
                    ),
                  ),
                ),
              ),

              //=================================Social Buttons========

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(
                              170, 40), // Set the minimum button size
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.blue, // Orange border color
                            ),
                            borderRadius:
                                BorderRadius.circular(8), // Border radius
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.facebook,
                              color: Colors.blue,
                            ),
                            SizedBox(
                                width: 6), // Adding space between icon and text
                            Text(
                              "Facebook",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14, // Adjust font size
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        // padding: const EdgeInsets.only(right: 25),
                        minimumSize:
                            const Size(160, 40), // Set the minimum button size
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.orange, // Orange border color
                          ),
                          borderRadius:
                              BorderRadius.circular(8), // Border radius
                        ),
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/google_logo.png', // Replace with your asset path
                            height: 18, // Adjust image height
                            width: 18, // Adjust image width
                          ),
                          const SizedBox(
                              width: 6), // Adding space between icon and text
                          const Text(
                            "Google",
                            style: TextStyle(
                              fontSize: 14, // Adjust font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //=======================End of social buttons================

              //=====================terms and policies===================
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("By Clicking 'Login' agreeing to our"),
                        Text(
                          "Terms And ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Colors.orange,
                          ),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Conditions",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Colors.orange,
                          ),
                        ),
                        Text("  & "),
                        Text(
                          "Privacy Policy",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Colors.orange,
                          ),
                        ),
                      ]),
                ],
              ),

              //========================================================
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildLanguageOption(
      String language, String imagePath) {
    return PopupMenuItem<String>(
      value: language,
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 10),
          Text(language),
        ],
      ),
    );
  }

//======================================Api Call =============================
  Future<void> login(String email, password) async {
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successful'); // Print success message

        // Navigate to the home screen after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(
              accesstoken: "QpwL5tke4Pnpja7X4",
            ), // Replace with your HomeScreen
          ),
        );
      } else {
        print('Login failed'); // Print failure message

        // Show a dialog box with an error message
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Error'),
            content: const Text('Please enter valid credentials.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('An error occurred: $e'); // Print error message
    }
  }
}
