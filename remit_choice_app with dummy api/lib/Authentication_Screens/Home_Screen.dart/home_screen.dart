// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';

import '../apiClient.dart';
import '../login_screen.dart';

class HomeScreen extends StatefulWidget {
  final String accesstoken;

  const HomeScreen({Key? key, required this.accesstoken}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiClient _apiClient =
      ApiClient(); // Import and use your ApiClient class

  Future<Map<String, dynamic>> getUserData() async {
    dynamic userRes;
    userRes = await _apiClient.getUserProfileData(widget.accesstoken);
    return userRes;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: FutureBuilder<Map<String, dynamic>>(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: size.height,
                width: size.width,
                color: Colors.blueGrey,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasData) {
              // Extract user data from snapshot
              String fullName = snapshot.data!['FullName'];
              String firstName = snapshot.data!['FirstName'];
              String lastName = snapshot.data!['LastName'];
              String birthDate = snapshot.data!['BirthDate'];
              String email = snapshot.data!['Email'][0]['Value'];
              String gender = snapshot.data!['Gender'];

              return Container(
                width: size.width,
                height: size.height,
                color: Colors.blueGrey.shade400,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // Display user information here
                      // Replace with widgets showing user data
                      // Example: Text(fullName), Text(email), etc.

                      // Add the Logout button here
                      TextButton(
                        onPressed: () async {
                          // Perform logout action
                          await _apiClient.logout(widget.accesstoken);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.redAccent.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 25,
                          ),
                        ),
                        child: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              // Handle the case when snapshot has no data
              return Container();
            }
          },
        ),
      ),
    );
  }
}
