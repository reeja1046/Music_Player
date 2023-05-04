import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title:const Text(
          'About Us',
          style: TextStyle(color: Colors.teal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [
            Text(
              'Developer : Reeja Grace Sabu',
              style: TextStyle(color: Colors.teal, fontSize: 18),
            ),
            Text(
              'This app was developed for all peoples without any age difference',
              style: TextStyle(color: Colors.teal, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
