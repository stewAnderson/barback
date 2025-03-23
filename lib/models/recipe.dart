class Recipe {
  final String name;
  final List<String> ingredients;
  final String instructions;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      name: map['name'],
      ingredients: List<String>.from(map['ingredients']),
      instructions: map['instructions'],
    );
  }
}
