class Recipe {
  final String name;
  final List<String> ingredients;
  final dynamic instructions; // Can be String or List<String>

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      name: map['name'],
      ingredients: map['ingredients'] is List
          ? List<String>.from(map['ingredients'])
          : map['ingredients'],
      instructions: map['instructions'] is List
          ? List<String>.from(map['instructions'])
          : map['instructions'],
    );
  }
}
