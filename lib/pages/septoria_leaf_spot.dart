import 'package:flutter/material.dart';

class septoria_leaf_spot extends StatefulWidget {
  const septoria_leaf_spot({Key? key}) : super(key: key);

  @override
  State<septoria_leaf_spot> createState() => _diseaseInfoState();
}

class _diseaseInfoState extends State<septoria_leaf_spot> {
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
                  "Septoria Leaf Spot",
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
                "  A fungal disease caused by Septoria lycopersici, common in humid areas and affecting foliage.",
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
                '• Spread through water splashes, contaminated soil, and equipment. ',
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
                '•Small, round, dark spots with white or gray centers on leaves, leading to leaf drop.',
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
                '• Mulch plants and avoid wetting leaves during watering.\n'
                '• Practice crop rotation to reduce soil-borne pathogens\n'
                '• Ensure adequate plant spacing. \n ',
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
                'Apply fungicides like chlorothalonil or copper-based sprays when symptoms first appear.\n',
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
