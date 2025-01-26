import 'package:flutter/material.dart';
import 'signup_page.dart'; // Import the SignUpPage

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF), // White color
              Color(0xFF2600FA), // Blue color
            ], // Set gradient colors
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.0, 1.0], // Adjust gradient stops
          ),
        ),
        child: Stack(
          children: [
            Center(
              // Wrap Column with Center
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Space between elements
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center the column horizontally
                children: <Widget>[
                  const Spacer(flex: 1), // Adjust spacer to push content up
                  Image.asset(
                    'assets/images/guypushup-intropage.png', // Path to the image
                    width: MediaQuery.of(context)
                        .size
                        .width, // Set image width to screen width
                    fit: BoxFit.cover, // Cover the entire width
                  ),
                  const Spacer(flex: 1), // Adjust spacer to push content up
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 0.0),
                padding: const EdgeInsets.all(
                    40.0), // Reduce padding to change tab height
                decoration: BoxDecoration(
                  color: Colors.white, // Ensure tab color is white
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30), // Set top left corner radius
                    topRight:
                        Radius.circular(30), // Set top right corner radius
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Welcome to Our App!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20), // Add vertical spacing
                    const Text(
                      'This is an introductory page for first-time users.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20), // Add vertical spacing
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SignUpPage()), // Navigate to SignUpPage
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.blue, // Set button background color
                        foregroundColor: Colors.white, // Set button text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Set button border radius
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32), // Set button padding
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
