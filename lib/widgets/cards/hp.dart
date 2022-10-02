import 'package:flutter/material.dart';

class Hp extends StatelessWidget {
  final String hp;
  const Hp({Key? key, required this.hp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('HP', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 5),
          Text(hp, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
