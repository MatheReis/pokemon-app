import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemon_app/src/core/constants/api.dart';
import 'package:pokemon_app/src/modules/home/models/pokemon_model.dart';

class PokemonService {
  final Dio dio;

  PokemonService(this.dio);

  Future<List<PokemonModel>> fecthPokemon() async {
    try {
      const String url = Api.baseUrl;
      final Response<dynamic> response = await dio.get(
        url,
        options: Options(responseType: ResponseType.json),
      );

      final Map<String, dynamic> data = jsonDecode(response.data.toString());
      final List<dynamic> pokemonArray = data['pokemon'];
      print(pokemonArray);

      var decodeJsonData = jsonDecode(response.data.toString());
      var pokedex = decodeJsonData['pokemon'];
      print(pokedex);

      return List.from(pokedex)
          .map((pokemon) => PokemonModel.fromMap(pokemon))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
