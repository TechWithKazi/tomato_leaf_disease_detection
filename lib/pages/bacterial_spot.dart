import 'package:flutter/material.dart';

class late_blight extends StatefulWidget {
  const late_blight({Key? key}) : super(key: key);

  @override
  State<late_blight> createState() => _diseaseInfoState();
}

class _diseaseInfoState extends State<late_blight> {
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
                  "Late_blight",
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
                "BA severe disease caused by Phytophthora infestans, affecting tomatoes and potatoes.",
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
                '•  High humidity and cool temperatures; spread through water, infected soil, and plant debriS. ',
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
                '• Large, water-soaked, gray-green lesions on leaves; white fungal growth on the undersides of leaves.',
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
                '• Plant resistant varieties if available.\n \n'
                '• Avoid overhead watering to reduce leaf wetness\n \n'
                '• Remove and destroy infected plants immediately. \n \n',
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
                'Use fungicides containing mancozeb or copper as a preventive measure, especially in wet seasons..  \n \n',
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
