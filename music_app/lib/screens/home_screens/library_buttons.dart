import 'package:enhanced_button/enhanced_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainButton extends StatefulWidget {
  String title;
  Widget onPressed;
  MainButton({super.key, required this.title, required this.onPressed});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return EnhancedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget.onPressed));
      },
      width: MediaQuery.of(context).size.height * 0.2,
      height: MediaQuery.of(context).size.height * 0.08,
      enhancedStyle: EnhancedButtonStyle(
        gradient: MaterialStateProperty.all(LinearGradient(
            colors: [Colors.teal, Colors.grey.withOpacity(0.28)])),
      ),
      child: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
