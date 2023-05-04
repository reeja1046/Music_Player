import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Support',
          style: TextStyle(color: Colors.teal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Any customer related queriess ???',
                style: TextStyle(color: Colors.teal, fontSize: 18),
              ),
              const Text(
                'Contact us : +91 6544813541',
                style: TextStyle(color: Colors.teal, fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 550),
                child: Text(
                  'Version 3.6.4.0.2',
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
