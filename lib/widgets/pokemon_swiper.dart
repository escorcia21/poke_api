import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:poke_api/models/pokemon_model.dart';
import 'package:poke_api/provider/pokeapi.dart';
import 'package:poke_api/widgets/cards/detailed_card.dart';

class PokeSwiper extends StatefulWidget {
  const PokeSwiper({Key? key}) : super(key: key);

  @override
  State<PokeSwiper> createState() => _PokeSwiperState();
}

class _PokeSwiperState extends State<PokeSwiper> {
  int page = 0;
  late Future<List<Pokemon>> _pokemonsList;

  @override
  void initState() {
    super.initState();
    _pokemonsList = PokemonProvider().getPokemons(page);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: _pokemonsList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return LayoutBuilder(
            builder: ((context, constraints) {
              return Swiper(
                // controller: controller,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var pokemon = snapshot.data as List<Pokemon>;
                  return PokeCard(pokemon: pokemon[index]);
                },
                itemWidth: constraints.maxWidth * 0.9,
                layout: SwiperLayout.STACK,
                onIndexChanged: ((value) {
                  if (value == snapshot.data!.length - 5) {
                    getNewPage();
                  }
                }),
                loop: false,
              );
            }),
          );
        });
  }

  getNewPage() async {
    print('fetching new page');
    final getprovider = PokemonProvider();
    page += 10;
    await getprovider.getPokemons(page).then((value) {
      setState(() {
        _pokemonsList.then((pokemons) => pokemons.addAll(value));
      });
    });
  }
}
