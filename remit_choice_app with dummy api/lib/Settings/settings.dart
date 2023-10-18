import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remit_choice_app/Authentication_Screens/login_screen.dart';

import '../AuthenticationProvider/AuthenticationProvider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                authProvider.logout(); // Clear authentication state
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
