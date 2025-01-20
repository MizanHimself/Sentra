import 'package:flutter/material.dart';
import 'signup_page.dart'; // Import the SignUpPage

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
        crossAxisAlignment: CrossAxisAlignment.center, // Center the column horizontally
        children: <Widget>[
          const Text(
            'Welcome to Our App!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40), // Add vertical spacing
          const Text(
            'This is an introductory page for first-time users.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40), // Add vertical spacing
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SignUpPage()), // Navigate to SignUpPage
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Set button background color
              foregroundColor: Colors.white, // Set button text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Set button border radius
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Set button padding
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
