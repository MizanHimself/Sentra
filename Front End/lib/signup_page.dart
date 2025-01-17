import 'package:flutter/material.dart'; // Import the Flutter material package
import 'login_page.dart'; // Ensure the correct import path

// Define the SignUpPage widget as a StatefulWidget
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

// Define the state for the SignUpPage widget
class _SignUpPageState extends State<SignUpPage> {
  // Controllers for the text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();
  bool _agreeToUserAgreement = false; // Checkbox state for user agreement
  bool _receiveNewsletter = false; // Checkbox state for newsletter

  // Function to handle sign up action
  void _signUp() {
    final firstName = _firstNameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final repeatPassword = _repeatPasswordController.text;
    print(
        'First Name: $firstName, Email: $email, Password: $password, Repeat Password: $repeatPassword, Agree to User Agreement: $_agreeToUserAgreement, Receive Newsletter: $_receiveNewsletter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
                      'Create an account', // Display the create account text
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 40), // Add vertical spacing
                    TextField(
                      controller: _firstNameController, // Bind the controller to the first name text field
                      decoration: InputDecoration(
                        labelText: 'First Name', // Set label text
                        hintText: 'John', // Set hint text
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10), // Set border radius
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Add vertical spacing
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
                    const SizedBox(height: 20), // Add vertical spacing
                    TextField(
                      controller: _repeatPasswordController, // Bind the controller to the repeat password text field
                      decoration: InputDecoration(
                        labelText: 'Repeat Password', // Set label text
                        hintText: '********', // Set hint text
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10), // Set border radius
                        ),
                      ),
                      obscureText: true, // Hide the repeat password text
                    ),
                    const SizedBox(height: 20), // Add vertical spacing
                    Row(
                      children: [
                        Checkbox(
                          value: _agreeToUserAgreement, // Bind the checkbox state
                          onChanged: (value) {
                            setState(() {
                              _agreeToUserAgreement = value!; // Update the checkbox state
                            });
                          },
                        ),
                        const Text('I agree to the User Agreement'), // Display the checkbox label
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _receiveNewsletter, // Bind the checkbox state
                          onChanged: (value) {
                            setState(() {
                              _receiveNewsletter = value!; // Update the checkbox state
                            });
                          },
                        ),
                        const Text('Receive Newsletter'), // Display the checkbox label
                      ],
                    ),
                    const SizedBox(height: 40), // Add vertical spacing
                    ElevatedButton(
                      onPressed: _signUp, // Bind the sign up function to the button
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Set button background color
                        foregroundColor: Colors.white, // Set button text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Set button border radius
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16), // Set button padding
                      ),
                      child: const Text(
                        'Sign Up', // Set button text
                        style: TextStyle(fontWeight: FontWeight.bold), // Set button text style
                      ),
                    ),
                    const SizedBox(height: 20), // Add vertical spacing
                    Align(
                      alignment: Alignment.center, // Center the text button
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()), // Navigate to LoginPage
                          );
                        },
                        child: const Text(
                          "Already have an account? Sign in now", // Set text button text
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
    );
  }
}
