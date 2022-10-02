import 'package:flutter/material.dart';
import 'package:poke_api/models/pokemon_model.dart';

class NormalCard extends StatelessWidget {
  final Pokemon pokemon;
  const NormalCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color(0xff009688), Color(0xffff5722)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(-4, 2), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Image.network(
              pokemon.image,
              fit: BoxFit.fill,
              width: 150,
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
