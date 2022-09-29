import 'package:flutter/material.dart';

class PokePage extends StatefulWidget {
  const PokePage({Key? key}) : super(key: key);

  @override
  State<PokePage> createState() => _PokePageState();
}

class _PokePageState extends State<PokePage> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView.builder(
      controller: controller,
      itemBuilder: (BuildContext context, int index) {
        return itemCard(index + 1);
      },
      itemCount: 4,
    );
  }
}

Widget itemCard(int pokemonId) {
  return Column(
    children: [
      const Text('Pokemon'),
      Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
            child: Image.network(
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ],
  );
}
