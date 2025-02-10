import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final String text;
  Color color;
  final VoidCallback onPress;

  Circle(
      {super.key,
      required this.text,
      this.color = Colors.grey,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 88,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Center(
                child: Text(
              text,
              style: TextStyle(fontSize: 23, color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
