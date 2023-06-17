import 'package:flutter/material.dart';
import 'package:music_app/database/functions/db_functions.dart';
import 'package:music_app/screens/home_screens/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() async {
    await requestPermission();
    gotomain();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 18, 25, 34),
          image: DecorationImage(
            image: AssetImage('assets/images/Chillax.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  gotomain() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomNavBar()));
    });
  }
}
