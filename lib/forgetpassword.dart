// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController usermailController = TextEditingController();

  @override
  void dispose() {
    usermailController.dispose();
    super.dispose();
  }

  // Email validation function
  bool isValidEmail(String email) {
    String pattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  // Reset Password function
  Future<void> resetPassword() async {
    try {
      // Send reset password email
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: usermailController.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Password reset email has been sent.",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        backgroundColor: Colors.green,
      ));
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase exceptions
      String errorMessage = '';
      if (e.code == "user-not-found") {
        errorMessage = "No user found with this email.";
      } else if (e.code == "invalid-email") {
        errorMessage = "Invalid email format.";
      } else {
        errorMessage = "Failed to reset password. Try again.";
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
     backgroundColor: Color(0xFFF5F5DC),
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 13, 46, 27),
          automaticallyImplyLeading: false,
          title: const Row(
            children: [
              Text(
                "Tomatoe Leaf ",
                style: TextStyle(
                  color: Color(0xFFF5F5DC),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                "Disease Detection",
                style: TextStyle(
                    color: Color(0xFFF5F5DC), fontWeight: FontWeight.bold),
              )
            ],
          ),
          centerTitle: true,
          elevation: 3,
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Reset Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: usermailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else if (!isValidEmail(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    hintText: "Enter your email",
                    hintStyle: TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Color.fromARGB(255, 240, 240, 240),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      resetPassword();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 13, 46, 27),
                    foregroundColor: Color(0xFFF5F5DC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Go back to the login page
                  },
                  child: const Text(
                    "Remember your password? Login",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
