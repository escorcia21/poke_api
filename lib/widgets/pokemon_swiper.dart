import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class PokeSwiper extends StatefulWidget {
  const PokeSwiper({Key? key}) : super(key: key);

  @override
  State<PokeSwiper> createState() => _PokeSwiperState();
}

class _PokeSwiperState extends State<PokeSwiper> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return itemCard(index + 1);
      },
      itemCount: 4,
      itemWidth: 300.0,
      layout: SwiperLayout.STACK,
    );
  }
}

Widget itemCard(int pokemonId) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.red,
    ),
    child: Image.network(
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png",
      fit: BoxFit.fill,
    ),
  );
}
