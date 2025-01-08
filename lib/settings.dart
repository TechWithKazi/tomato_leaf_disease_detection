// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tomatoe_leaf_disease_detection/Login.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Future<void> deleteUser(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        bool confirm = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Delete Account'),
              content: const Text(
                  'Are you sure you want to delete your account? This action cannot be undone.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Cancel
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Delete'),
                ),
              ],
            );
          },
        );

        if (confirm) {
          await user.delete();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account deleted successfully')));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        } else {
          print('Deletion canceled by user');
        }
      } else {
        print('No user is currently signed in.');
      }
    } catch (e) {
      print('Error deleting user: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error deleting account: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5DC),
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
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          children: [
            const SizedBox(
              height: 3,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Settings",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.06,
                    color: Color.fromARGB(255, 13, 46, 27)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildMenuItem(
              title: "Delete Account",
              icon: Icons.delete,
              onTap: () {
                deleteUser(context);
              },
              screenWidth: screenWidth,
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              title: "Sign Out",
              icon: Icons.logout_outlined,
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              screenWidth: screenWidth,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String title,
    required IconData icon,
    required Function onTap,
    required double screenWidth,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(15), // Rounded border for Material
        child: InkWell(
          onTap: () => onTap(),
          borderRadius: BorderRadius.circular(15), // Rounded ripple effect
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 13, 46, 27),
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: 15, // Nice vertical padding inside
            ),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: Color(0xFFF5F5DC),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(
                  icon,
                  color: Color(0xFFF5F5DC),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
