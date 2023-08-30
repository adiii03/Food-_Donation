import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/screens/doner_reg.dart';
import 'package:helloworld/screens/signup.dart';
import 'package:helloworld/screens/startscreen.dart';
import 'package:helloworld/screens/login.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Start with the SplashScreen
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // After 3 seconds, navigate to the LoginScreen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DonorRegistrationScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StartScreen();
  }
}