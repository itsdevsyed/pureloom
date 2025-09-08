import 'package:flutter/material.dart';
import '../widgets/login_button.dart';
import 'home_screen.dart';  // New file

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: LoginButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
          },
        ),
      ),
    );
  }
}
