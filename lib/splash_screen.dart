import 'package:flutter/material.dart';
import 'login_register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a 3-second delay before navigating to WelcomeScreen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginRegisterScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/wall.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // White overlay with opacity
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.7),
            ),
          ),

          // Center the loading spinner
          Center(
            child: Container(
              width: 100, // Size of the green circle
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green[900], // Green background color
                shape: BoxShape.circle, // Make the container round
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 3,
                    offset: const Offset(0, 4), // Shadow offset
                  ),
                ],
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 6, // Thicker circular progress
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
