import 'package:flutter/material.dart';

class leaf_curl extends StatefulWidget {
  const leaf_curl({Key? key}) : super(key: key);

  @override
  State<leaf_curl> createState() => _diseaseInfoState();
}

class _diseaseInfoState extends State<leaf_curl> {
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 13, 46, 27),
                      width: 5,
                    ),
                  ),
                ),
                child: const Text(
                  "leaf curl",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 13, 46, 27)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                " A viral disease spread by whiteflies, leading to curling and thickening of leaves.",
                style: TextStyle(
                  color: Color.fromARGB(255, 13, 46, 27),
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 13, 46, 27),
                      width: 5,
                    ),
                  ),
                ),
                child: const Text(
                  "Causes",
                  style: TextStyle(
                    color: Color.fromARGB(255, 13, 46, 27),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                '•  Whitefly transmission, especially during warm, dry weather. ',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 13, 46, 27),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 13, 46, 27),
                      width: 5,
                    ),
                  ),
                ),
                child: const Text(
                  "Symptoms",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 13, 46, 27),
                  ),
                ),
              ),
              const Text(
                '• Upward leaf curling, stunted plant growth, reduced fruit size.',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 13, 46, 27),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 13, 46, 27),
                      width: 5,
                    ),
                  ),
                ),
                child: const Text(
                  "Prevention",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 13, 46, 27),
                  ),
                ),
              ),
              const Text(
                '• Use insect-proof netting to limit whitefly exposure.\n'
                '• Practice crop rotation and use whitefly-resistant varieties\n'
                '• Remove weeds that may host the virus. \n',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 13, 46, 27),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 13, 46, 27),
                      width: 5,
                    ),
                  ),
                ),
                child: const Text(
                  "Treatment",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 13, 46, 27),
                  ),
                ),
              ),
              const Text(
                'Remove and destroy infected plants. Use insecticides to control whitefly populations.  \n ',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 13, 46, 27),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Note: It is essential to consult with an agricultural specialist or plant pathologist for an accurate diagnosis and treatment recommendations tailored to your specific crop situation.",
                      style: TextStyle(
                          color: Color.fromARGB(255, 13, 46, 27),
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
