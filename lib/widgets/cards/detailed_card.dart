import 'package:flutter/material.dart';
import 'package:poke_api/models/pokemon_model.dart';
import 'package:poke_api/widgets/cards/card_bg.dart';
import 'package:poke_api/widgets/cards/hp.dart';
import 'package:poke_api/widgets/cards/image.dart';
import 'package:poke_api/widgets/cards/stats.dart';
import 'package:poke_api/widgets/cards/type.dart';

class PokeCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokeCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            CardBg(color: typeColor(pokemon.types[0]['type']['name'])),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Hp(hp: pokemon.hp)),
                  PokeImage(image: pokemon.image, name: pokemon.name),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: types(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stat(stat: 'Attack', value: pokemon.attack),
                      Stat(stat: 'Defense', value: pokemon.defense),
                      Stat(stat: 'Speed', value: pokemon.speed),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> types() {
    final List<Widget> types = [];
    for (var type in pokemon.types) {
      var pokeType = type['type']['name'];
      types.add(PokeType(type: pokeType, color: typeColor(pokeType)));
    }
    return types;
  }

  Color typeColor(String type) {
    switch (type) {
      case 'grass':
        return const Color(0xff78c850);
      case 'fire':
        return const Color(0xfff08030);
      case 'water':
        return const Color(0xff6890f0);
      case 'bug':
        return const Color(0xffa8b820);
      case 'normal':
        return const Color(0xffa8a878);
      case 'poison':
        return const Color(0xffa040a0);
      case 'electric':
        return const Color(0xfff8d030);
      case 'ground':
        return const Color(0xffe0c068);
      case 'fairy':
        return const Color(0xffee99ac);
      case 'fighting':
        return const Color(0xffc03028);
      case 'psychic':
        return const Color(0xfff85888);
      case 'rock':
        return const Color(0xffb8a038);
      case 'ghost':
        return const Color(0xff705898);
      case 'ice':
        return const Color(0xff98d8d8);
      case 'dragon':
        return const Color(0xff7038f8);
      case 'dark':
        return const Color(0xff705848);
      case 'steel':
        return const Color(0xffb8b8d0);
      default:
        return const Color(0xff78c850);
    }
  }
}
