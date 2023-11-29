class PokemonModel {
  final int? id;
  final String? name;
  final String? image;
  final List<String>? type;
  final String? height;
  final String? weight;

  PokemonModel({
    this.id,
    this.name,
    this.image,
    this.type,
    this.height,
    this.weight,
  });

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      image: map['img'] ?? "",
      type: map['type'] != null ? List<String>.from(map['type']) : [],
      height: map['height'] ?? "",
      weight: map['weight'] ?? "",
    );
  }
}
