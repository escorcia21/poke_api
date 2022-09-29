import 'package:flutter/material.dart';
import 'package:poke_api/widgets/pokemon_page.dart';
import 'package:poke_api/widgets/pokemon_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Poke API')),
      ),
      body: Column(
        children: [
          Expanded(flex: 1, child: PokePage()),
          Expanded(flex: 2, child: PokeSwiper())
        ],
      ),
    );
  }
}
