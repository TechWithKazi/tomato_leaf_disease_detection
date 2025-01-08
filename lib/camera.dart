import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tomatoe_leaf_disease_detection/pages/bacterial_spot.dart';
import 'package:tomatoe_leaf_disease_detection/pages/early_blight.dart';
import 'package:tomatoe_leaf_disease_detection/pages/late_blight.dart';
import 'package:tomatoe_leaf_disease_detection/pages/leaf_curl.dart';
import 'package:tomatoe_leaf_disease_detection/pages/leaf_mold.dart';
import 'package:tomatoe_leaf_disease_detection/pages/mosaic_virus.dart';
import 'package:tomatoe_leaf_disease_detection/pages/septoria_leaf_spot.dart';
import 'package:tomatoe_leaf_disease_detection/pages/spider_mites.dart';
import 'package:tomatoe_leaf_disease_detection/pages/target_spot.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? filepath;
  double confidence = 0.0;
  String label = "";

  Future<void> _tfliteInit() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

  void _showAlertDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFFF5F5DC),
            title: const Text(
              "Instructions",
              style: TextStyle(color: Color.fromARGB(255, 13, 46, 27)),
            ),
            content: const SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                    "1. Clean the Camera: Wipe your camera gently.",
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      "2. Good Lighting: Use natural or soft light to avoid shadows.."),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      "3 .Plain Background: Place the leaf on a solid-colored surface."),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      "4. Steady Camera: Use a tripod or hold the camera steady above the leaf."),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      "5. Focus Clearly: Tap to focus on the leaf for detail."),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      "6. Center the Leaf: Frame it with a small margin around."),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      "7. High Resolution: Use the highest resolution for clarity."),
                  SizedBox(
                    height: 8,
                  ),
                  // Instructions truncated for brevity
                  Text(
                      "NB. Failure to follow the provided instructions may result in inaccurate diagnoses or predictions, ultimately leading to suboptimal crop management. Please note that this application is specifically designed and trained for detecting diseases in tomato leaves and may not perform effectively on leaves of other crops."),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  Future<void> pickCamera() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    setState(() {
      filepath = File(image.path);
    });

    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );

    if (recognitions != null && recognitions.isNotEmpty) {
      setState(() {
        label = recognitions[0]["label"] == "Class 8"
            ? "mosaic_virus"
            : recognitions[0]["label"] == "Class 11"
                ? "target_spot"
                : recognitions[0]["label"].toString();
        confidence = recognitions[0]["confidence"] * 100;
      });
    }
  }

  Future<void> pickImageGallery() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() {
      filepath = File(image.path);
    });

    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );

    if (recognitions != null && recognitions.isNotEmpty) {
      setState(() {
        label = recognitions[0]["label"] == "Class 8"
            ? "mosaic_virus"
            : recognitions[0]["label"] == "Class 11"
                ? "target_spot"
                : recognitions[0]["label"].toString();
        confidence = recognitions[0]["confidence"] * 100;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _showAlertDialog();
    _tfliteInit();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 46, 27),
        automaticallyImplyLeading: false,
        title: const Text(
          "Tomato Leaf Disease Detection",
          style: TextStyle(
            color: Color(0xFFF5F5DC),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Column(
              children: [
                Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 238, 228, 231),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 13, 46, 27),
                            borderRadius: BorderRadius.circular(12),
                            image: filepath == null
                                ? const DecorationImage(
                                    image: AssetImage("assets/photo.png"),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: filepath != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    filepath!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const Center(child: Text("")),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Label: $label",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Confidence: ${confidence.toStringAsFixed(0)}%",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildActionButton(
                  label: "Take a Photo",
                  onPressed: pickCamera,
                ),
                const SizedBox(height: 12),
                _buildActionButton(
                  label: "Pick from Gallery",
                  onPressed: pickImageGallery,
                ),
                const SizedBox(height: 12),
                _buildActionButton(
                  label: "Diagnose",
                  onPressed: () {
                    if (label == "bacterial_spot") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Bacterial_Spot()));
                    } else if (label == "early_blight") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const early_blight()));
                    } else if (label == "leaf_curl") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const leaf_curl()));
                    } else if (label == "late_blight") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const late_blight()));
                    } else if (label == "leaf_mold") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const leaf_mold()));
                    } else if (label == "mosaic_virus") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const mosaic_virus()));
                    } else if (label == "septoria_leaf_spot") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const septoria_leaf_spot()));
                    } else if (label == "spider_mites") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const spider_mites()));
                    } else if (label == "target_spot") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const target_spot()));
                    } else if (label == "healthy") {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: const Color(0xFFF5F5DC),
                              title: const Text('Image a Healthy Tomato Leaf'),
                              content: const Text('No need for diagnosis..'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false); // Cancel
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ],
                            );
                          });
                    } else if (label == "Not a Leaf") {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Image upload  not a Leaf'),
                              content: const Text('No need for diagnosis..'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false); // Cancel
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ],
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: const Color(0xFFF5F5DC),
                              title: const Text('Please take a Picture'),
                              content: const Text(
                                  'Please Take an Picture before diagnosis..'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false); // Cancel
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ],
                            );
                          });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 13, 46, 27),
        foregroundColor: const Color(0xFFF5F5DC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
