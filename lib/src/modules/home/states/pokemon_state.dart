import 'package:pokemon_app/src/modules/home/models/pokemon_model.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonSucess extends PokemonState {
  final List<PokemonModel> pokemons;

  PokemonSucess({required this.pokemons});
}

class PokemonError extends PokemonState {
  final String? message;

  PokemonError(this.message);
}
