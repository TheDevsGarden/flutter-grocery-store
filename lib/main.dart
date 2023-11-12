import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/firebase_options.dart';
import 'package:test_flutter/screens/splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

// MARK - ANDROID SPLASH SCREEN

