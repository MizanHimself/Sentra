import 'package:flutter/material.dart'; // Import the Flutter material package
import 'signup_page.dart'; // Import the SignUpPage
import 'widgets/header.dart'; // Import the GlobalHeader
import 'widgets/footer.dart'; // Import the GlobalFooter

// Define the LoginPage widget as a StatefulWidget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Define the state for the LoginPage widget
class _LoginPageState extends State<LoginPage> {
  // Controllers for the email and password text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle login action
  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;
    print('Email: $email, Password: $password'); // Print email and password to console
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const GlobalHeader(), // Add the global header
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(32.0), // Add padding to the container
                      constraints: const BoxConstraints(maxWidth: 400), // Set max width for the container
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
                        crossAxisAlignment: CrossAxisAlignment.start, // Align the column to the start horizontally
                        children: <Widget>[
                          const Text(
                            'yourlogo', // Display the logo text
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Set text style
                          ),
                          const SizedBox(height: 40), // Add vertical spacing
                          const Text(
                            'Hello, welcome!', // Display the welcome text
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 40), // Add vertical spacing
                          TextField(
                            controller: _emailController, // Bind the controller to the email text field
                            decoration: InputDecoration(
                              labelText: 'Email address', // Set label text
                              hintText: 'name@mail.com', // Set hint text
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10), // Set border radius
                              ),
                            ),
                          ),
                          const SizedBox(height: 20), // Add vertical spacing
                          TextField(
                            controller: _passwordController, // Bind the controller to the password text field
                            decoration: InputDecoration(
                              labelText: 'Password', // Set label text
                              hintText: '********', // Set hint text
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10), // Set border radius
                              ),
                            ),
                            obscureText: true, // Hide the password text
                          ),
                          const SizedBox(height: 40), // Add vertical spacing
                          ElevatedButton(
                            onPressed: _login, // Bind the login function to the button
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Set button background color
                              foregroundColor: Colors.white, // Set button text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Set button border radius
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16), // Set button padding
                            ),
                            child: const Text(
                              'Login', // Set button text
                              style: TextStyle(fontWeight: FontWeight.bold), // Set button text style
                            ),
                          ),
                          const SizedBox(height: 20), // Add vertical spacing
                          Align(
                            alignment: Alignment.centerRight, // Align the text button to the right
                            child: TextButton(
                              onPressed: () {}, // Empty function for forgot password button
                              child: const Text(
                                'Forgot password?', // Set text button text
                                style: TextStyle(fontSize: 12), // Set text button text style
                              ),
                            ),
                          ),
                          const SizedBox(height: 40), // Add vertical spacing
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center, // Center the row horizontally
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.facebook), // Set icon for Facebook
                                onPressed: () {}, // Empty function for Facebook button
                              ),
                              const SizedBox(width: 10), // Add horizontal spacing
                              IconButton(
                                icon: const Icon(Icons.camera_alt), // Set icon for camera
                                onPressed: () {}, // Empty function for camera button
                              ),
                              const SizedBox(width: 10), // Add horizontal spacing
                              IconButton(
                                icon: const Icon(Icons.camera_alt), // Set icon for camera
                                onPressed: () {}, // Empty function for camera button
                              ),
                            ],
                          ),
                          const Center(child: Text('Follow')), // Display follow text
                          const SizedBox(height: 20), // Add vertical spacing
                          Align(
                            alignment: Alignment.center, // Center the text button
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUpPage()), // Navigate to SignUpPage
                                );
                              },
                              child: const Text(
                                "Don't have an account yet? Sign Up now", // Set text button text
                                style: TextStyle(fontSize: 14, color: Colors.blue), // Set text button text style
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2, // Set container width to half of the screen
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.white], // Set gradient colors
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const GlobalFooter(), // Add the global footer
        ],
      ),
    );
  }
}
