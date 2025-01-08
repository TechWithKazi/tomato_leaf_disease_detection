import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:tomatoe_leaf_disease_detection/Login.dart';
import 'package:tomatoe_leaf_disease_detection/camera.dart';
import 'package:tomatoe_leaf_disease_detection/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _userId;
  String? _email;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _userId = user.uid;
        _email = user.email;
      });
    }
  }

  String getGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(this.context).size.width;

    // Define the maximum padding value
    const maxPadding = 10.0;
    final screenHieght = MediaQuery.of(this.context).size.height;

    // Calculate the actual padding based on the screen width
    final paddingValue = screenWidth > 700 ? maxPadding : screenWidth * 0.02;
    final greeting = getGreeting();
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
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(paddingValue),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: screenHieght * 0.009),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                greeting,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.055),
                              ),
                              Text(
                                _email!.replaceAll("@gmail.com", ""),
                                style: TextStyle(
                                    fontSize: screenWidth * 0.047,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          // i
                          //gnore: prefer_const_constructors
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pushReplacement(
                                  this.context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: Icon(
                              Icons.logout_outlined,
                              size: screenWidth * 0.12,
                              color: Color.fromARGB(255, 13, 46, 27),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Common Tomatoe Leaf Disease",
                      style: TextStyle(
                        color: Color.fromARGB(255, 13, 46, 27),
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.049,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Material(
                      color: Color(0xFFF5F5DC),
                      child: Row(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.all(4), // Space for the border
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  60), // Matches the ClipRRect radius
                              border: Border.all(
                                color: Colors
                                    .green[900]!, // Dark green border color
                                width: 3, // Border width
                              ),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                  "assets/early.jpg",
                                  height: 130,
                                  width: 130,
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Early Blight",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 13, 46, 27),
                                      fontSize: screenWidth * 0.049),
                                ),
                                const Text(
                                    "A fungal disease caused by Alternaria solani, presenting as dark, concentric spots on leaves, leading to leaf drop and reduced yields. It often affects older leaves first.",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 114, 114, 114),
                                        fontWeight: FontWeight.bold),
                                    softWrap: true),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Material(
                      color: Color(0xFFF5F5DC),
                      child: Row(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.all(4), // Space for the border
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  60), // Matches the ClipRRect radius
                              border: Border.all(
                                color: Colors
                                    .green[900]!, // Dark green border color
                                width: 3, // Border width
                              ),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                  "assets/late.jpg",
                                  height: 150,
                                  width: 130,
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Late Blight",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 13, 46, 27),
                                      fontSize: screenWidth * 0.049),
                                ),
                                const Text(
                                    "Caused by Phytophthora infestans, this disease appears as brown or black water-soaked spots, primarily on leaves, which quickly spread and can destroy entire plants. It's highly infectious and can spread rapidly in wet, cool conditions.",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 114, 114, 114),
                                        fontWeight: FontWeight.bold),
                                    softWrap: true),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Material(
                      color: Color(0xFFF5F5DC),
                      child: Row(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.all(4), // Space for the border
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  60), // Matches the ClipRRect radius
                              border: Border.all(
                                color: Colors
                                    .green[900]!, // Dark green border color
                                width: 3, // Border width
                              ),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                  "assets/bacterial.jpg",
                                  height: 150,
                                  width: 130,
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bacterial Spot",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 13, 46, 27),
                                      fontSize: screenWidth * 0.049),
                                ),
                                const Text(
                                    "A bacterial infection caused by Xanthomonas species, characterized by small, dark, water-soaked spots on leaves. This disease can lead to leaf death, especially in warm, wet weather.",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 114, 114, 114),
                                        fontWeight: FontWeight.bold),
                                    softWrap: true),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Material(
                      color: Color(0xFFF5F5DC),
                      child: Row(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.all(4), // Space for the border
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  60), // Matches the ClipRRect radius
                              border: Border.all(
                                color: Colors
                                    .green[900]!, // Dark green border color
                                width: 3, // Border width
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.asset(
                                "assets/curlf.jpg",
                                height: 150,
                                width: 130,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Leaf Curl",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 13, 46, 27),
                                      fontSize: screenWidth * 0.049),
                                ),
                                const Text(
                                    " it is an upward leaf curling, with affected leaves becoming leathery and yellowish. It can lead to stunted growth and reduced tuber production",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 114, 114, 114),
                                        fontWeight: FontWeight.bold),
                                    softWrap: true),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Material(
                      color: Color(0xFFF5F5DC),
                      child: Row(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.all(4), // Space for the border
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  60), // Matches the ClipRRect radius
                              border: Border.all(
                                color: Colors
                                    .green[900]!, // Dark green border color
                                width: 3, // Border width
                              ),
                            ),

                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                  "assets/.jpg",
                                  height: 150,
                                  width: 130,
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Leaf Mold",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 13, 46, 27),
                                        fontSize: screenWidth * 0.049),
                                  ),
                                  const Text(
                                      "Caused by Passalora fulva, this fungal disease shows up as yellow spots on the top side of leaves and moldy growth underneath. It thrives in humid environments and can cause leaf drop and lower plant health",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 114, 114, 114),
                                          fontWeight: FontWeight.bold),
                                      softWrap: true),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 13, 46, 27),
                        foregroundColor: Color(0xFFF5F5DC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Scan Leaf",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            const Icon(Icons.arrow_forward, size: 20),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 13, 46, 27),
                        foregroundColor: Color(0xFFF5F5DC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              25), // Fully rounded corners
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0), // Padding inside
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Settings",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            const Icon(Icons.arrow_forward, size: 20),
                          ],
                        ),
                      ),
                    )
                  ])),
        ));
  }
}
