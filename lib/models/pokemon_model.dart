class PokemonList {
  List<Pokemon> pokemons = [];

  PokemonList();

  PokemonList.fromJsonList(jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final pokemon = Pokemon.fromJsonMap(item);
      pokemons.add(pokemon);
    }
  }
}

class Pokemon {
  String name;
  String image;
  List types;
  String hp;
  String attack;
  String defense;
  String speed;
  List stats;

  Pokemon(
      {required this.name,
      required this.image,
      required this.types,
      required this.hp,
      required this.attack,
      required this.defense,
      required this.speed,
      required this.stats});

  factory Pokemon.fromJsonMap(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      image: json['sprites']['other']['home']['front_shiny'],
      types: json['types'],
      hp: json['stats'][0]['base_stat'].toString(),
      attack: json['stats'][1]['base_stat'].toString(),
      defense: json['stats'][2]['base_stat'].toString(),
      speed: json['stats'][5]['base_stat'].toString(),
      stats: json['stats'],
    );
  }
}
