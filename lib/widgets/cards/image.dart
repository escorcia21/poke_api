import 'package:flutter/material.dart';

class PokeImage extends StatelessWidget {
  final String image;
  final String name;
  const PokeImage({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double dimensions = size.height < 700 ? 180 : 200;
    return Column(
      children: [
        Container(
          height: dimensions,
          width: dimensions,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(image),
            ),
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
