import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hemosense/screen/contact_center.dart';
import 'package:hemosense/screen/history.dart';
import 'package:hemosense/screen/homepage.dart';
import 'package:hemosense/screen/tutorial.dart';
import 'package:hemosense/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HemoSense',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/history': (context) => const HistoryScreen(),
        '/help': (context) => const HelpScreen(),
        '/tutorial': (context) => const TutorialScreen()
      },
    );
  }
}
