import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tomatoe_leaf_disease_detection/camera.dart';
import 'package:tomatoe_leaf_disease_detection/home.dart';
import 'package:tomatoe_leaf_disease_detection/settings.dart';
import 'package:tomatoe_leaf_disease_detection/splash.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: dotenv.env["apiKey"]!,
            authDomain: dotenv.env["authDomain"]!,
            projectId: dotenv.env["projectId"]!,
            storageBucket: dotenv.env["storageBucket"]!,
            messagingSenderId: dotenv.env["messagingSenderId"]!,
            appId: dotenv.env["appId"]!,
            measurementId: dotenv.env["measurementId"]!));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tomatoe Lead Disease Detection System',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}
