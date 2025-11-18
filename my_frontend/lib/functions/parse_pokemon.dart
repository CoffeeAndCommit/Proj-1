import '../models/pokemon_model.dart';

Pokemon parsePokemon(Map<String, dynamic> pokemonJson, String id) {
  if (pokemonJson.isEmpty) {
    return Pokemon(
      id: '',
      name: '',
      type: 'Error',
    );
  }

  return Pokemon.fromJson(
    {
      'id': id,
      'name': pokemonJson['name'],
      'type': pokemonJson['type'],
    }
  )
  ;
}
