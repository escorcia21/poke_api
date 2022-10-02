import 'package:flutter/material.dart';

class PokeType extends StatelessWidget {
  final String type;
  final Color color;
  const PokeType({Key? key, required this.type, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: Center(
            child: Text(
              type,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16),
            ),
          ),
        ));
  }
}
