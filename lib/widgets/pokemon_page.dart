import 'package:flutter/material.dart';
import 'package:poke_api/provider/pokeapi.dart';
import 'package:poke_api/widgets/cards/normal_card.dart';

import '../models/pokemon_model.dart';

class PokePage extends StatefulWidget {
  const PokePage({Key? key}) : super(key: key);

  @override
  State<PokePage> createState() => _PokePageState();
}

class _PokePageState extends State<PokePage> {
  int page = 0;
  late Future<List<Pokemon>> _pokemonsList;
  late PageController _scrollController;
  final snackBar = SnackBar(
      content: const Text('Fetching more pokemons...'),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Algo de código para ¡deshacer el cambio!
        },
        textColor: const Color(0xfff08030),
      ));

  @override
  void initState() {
    super.initState();
    _pokemonsList = PokemonProvider().getPokemons(page);
    _scrollController = PageController(viewportFraction: 1 / 2, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: _pokemonsList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return PageView.builder(
            padEnds: false,
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              return NormalCard(pokemon: snapshot.data![index]);
            },
            itemCount: snapshot.data!.length,
            onPageChanged: ((index) {
              if (index == snapshot.data!.length - 7) {
                getNewPage();
              }
            }),
          );
        });
  }

  getNewPage() async {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    final getprovider = PokemonProvider();
    page += 10;
    await getprovider.getPokemons(page).then((value) {
      setState(() {
        _pokemonsList.then((pokemons) => pokemons.addAll(value));
      });
    });
  }
}
