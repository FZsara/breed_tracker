import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import the SplashScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SQFLite Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        hintColor: Colors.tealAccent,
      ),
      home: SplashScreen(), // Set SplashScreen as the home widget
    );
  }
}
