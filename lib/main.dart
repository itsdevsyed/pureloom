import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Your LoginScreen file

void main() {
  runApp(PureloomApp());
}

class PureloomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pureloom',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(), // Start directly at LoginScreen
    );
  }
}
