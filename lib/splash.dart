// ignore: file_names

import 'package:flutter/material.dart';
import 'package:tomatoe_leaf_disease_detection/Login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

//<a href="https://www.freepik.com/free-vector/medical-video-call-consultation-illustration_11116016.htm#query=doctors&position=13&from_view=search&track=sph&uuid=5ea5c0d4-3e01-4502-bf32-94eafb4821b7">Image by redgreystock</a> on Freepik
  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 6000));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(this.context).size.width;

    // Define the maximum padding value
    const maxPadding = 10.0;

    // Calculate the actual padding based on the screen width
    final paddingValue = screenWidth > 700 ? maxPadding : screenWidth * 0.02;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5DC),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(paddingValue),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/tomato.png",
                  fit: BoxFit.cover, // Adjust image fitting
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tomato Leaf",
                  style: TextStyle(
                    color: Color.fromARGB(255, 13, 46, 27),
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.052,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "Disease Detection System",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 86, 130, 87),
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.052,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
