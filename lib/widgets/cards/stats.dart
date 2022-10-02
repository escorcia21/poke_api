import 'package:flutter/material.dart';

class Stat extends StatelessWidget {
  final String stat;
  final String value;
  const Stat({Key? key, required this.stat, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 60,
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            stat,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
