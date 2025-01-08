import 'package:flutter/material.dart';

class Bacterial_Spot extends StatefulWidget {
  const Bacterial_Spot({Key? key}) : super(key: key);

  @override
  State<Bacterial_Spot> createState() => _diseaseInfoState();
}

class _diseaseInfoState extends State<Bacterial_Spot> {
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
                  "Bacterial spot",
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
                "Bacterial spot is a tomato disease caused by the bacterium Xanthomonas campestris that affects leaves, stems, and fruits.",
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
                '•  Primarily spread through infected seeds, contaminated soil, and water. It thrives in warm, humid conditions common in Zimbabwe’s summer months. ',
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
                '• Dark, water-soaked spots on leaves that may turn yellow and drop off; small, rough spots on fruits.',
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
                '• Use certified disease-free seeds.\n '
                '• Rotate crops and avoid planting tomatoes in the same soil yearly\n '
                '• Maintain good airflow by spacing plants adequately. \n ',
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
                '•Treatment: Remove infected plants and treat remaining plants with copper-based fungicides. Use bactericides if available.  \n ',
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
