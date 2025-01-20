import 'package:flutter/material.dart';
import 'intro_page.dart'; // Import the IntroPage
import 'login_page.dart'; // Import the LoginPage
import 'signup_page.dart'; // Import the SignUpPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MrFrog App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthCheck(), // Set the AuthCheck as the home page
    );
  }
}

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate checking if the user is logged in
    bool isLoggedIn = false; // Change this based on your authentication logic

    if (isLoggedIn) {
      return const LoginPage(); // Navigate to LoginPage if logged in
    } else {
      return const IntroPage(); // Navigate to IntroPage if not logged in
    }
  }
}
