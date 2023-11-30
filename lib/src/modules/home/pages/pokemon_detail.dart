import 'package:flutter/material.dart';
import 'package:pokemon_app/src/core/constants/app_colors.dart';
import 'package:pokemon_app/src/core/widgets/body_template.dart';
import 'package:pokemon_app/src/modules/home/models/pokemon_model.dart';

class PokemonDetailsPage extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonDetailsPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyTemplate(
      imgUrl: pokemon.image,
      isDetailPage: true,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              pokemon.name ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (pokemon.type != null && pokemon.type!.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildTypeWidget(pokemon.type![0]),
                  if (pokemon.type!.length > 1) _buildTypeWidget(pokemon.type![1]),
                ],
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatWidget('Weight', pokemon.weight),
                _buildStatWidget('Height', pokemon.height),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeWidget(String type) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(type),
    );
  }

  Widget _buildStatWidget(String label, String? value) {
    return Column(
      children: [
        Text(
          value ?? '',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
