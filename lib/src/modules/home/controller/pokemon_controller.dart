import 'package:flutter/material.dart';
import 'package:pokemon_app/src/modules/home/services/pokemon_service.dart';
import 'package:pokemon_app/src/modules/home/states/pokemon_state.dart';

class PokemonController extends ValueNotifier<PokemonState> {
  final PokemonService pokemonService;

  PokemonController(this.pokemonService) : super(PokemonInitial());

  Future<void> getPokemon() async {
    try {
      value = PokemonLoading();

      final pokemons = await pokemonService.fecthPokemon();
      value = PokemonSucess(pokemons: pokemons);
    } catch (e) {
      value = PokemonError(e.toString());
    }
  }
}
