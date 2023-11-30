import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:pokemon_app/src/core/widgets/body_template.dart';
import 'package:pokemon_app/src/modules/home/controller/pokemon_controller.dart';
import 'package:pokemon_app/src/modules/home/models/pokemon_model.dart';
import 'package:pokemon_app/src/modules/home/pages/pokemon_detail.dart';
import 'package:pokemon_app/src/modules/home/services/pokemon_service.dart';
import 'package:pokemon_app/src/modules/home/states/pokemon_state.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final PokemonController pokemonController =
      PokemonController(PokemonService(Dio()));

  List<PokemonModel> pokemon = [];

  buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(
      isDetailPage: false,
      body: ValueListenableBuilder(
        valueListenable: pokemonController,
        builder: (context, state, __) {
          if (state is PokemonInitial) {
            pokemonController.getPokemon();
            return buildLoading();
          } else if (state is PokemonLoading) {
            return buildLoading();
          } else if (state is PokemonSucess) {
            pokemon = state.pokemons;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: pokemon.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PokemonDetailsPage(pokemon: pokemon[index]),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: FadeInImage.memoryNetwork(
                            imageErrorBuilder: (context, error, stackTrace) {
                              return const SizedBox();
                            },
                            placeholder: kTransparentImage,
                            image: pokemon[index].image!,
                            imageScale: 0.75,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('#${pokemon[index].id}'),
                              Text(pokemon[index].name ?? ""),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is PokemonError) {
            return Center(
              child: Text(state.message!),
            );
          }
          return Container();
        },
      ),
    );
  }
}
