import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/models/recipe.dart';

class RecipeScreen extends StatefulWidget {
  final String recipeName;

  const RecipeScreen({super.key, required this.recipeName});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final DatabaseReference db = FirebaseDatabase.instance.ref();
  Recipe? recipe;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecipe();
  }

  Future<void> fetchRecipe() async {
    try {
      final snapshot = await db.child('recipes').get();
      if (snapshot.exists) {
        final Map<dynamic, dynamic> recipesMap =
            snapshot.value as Map<dynamic, dynamic>;
        final recipeEntry = recipesMap.values.firstWhere(
          (r) => r['name'] == widget.recipeName,
          orElse: () => null,
        );
        if (recipeEntry != null) {
          setState(() {
            recipe = Recipe.fromMap(Map<String, dynamic>.from(recipeEntry));
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching recipe: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Recipe Details"),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (recipe == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Recipe Details"),
        ),
        body: const Center(
          child: Text("Recipe not found"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Details"),
      ),
      body: RecipeDetail(recipe: recipe!),
    );
  }
}

// Widget that displays a Recipe model (no Scaffold or AppBar)
class RecipeDetail extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              recipe.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Ingredients:',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            ...recipe.ingredients
                .map<Widget>((ingredient) => Text('- $ingredient')),
            Text(
              'Instructions:',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            ...recipe.instructions is List
                ? (recipe.instructions as List)
                    .map<Widget>((step) => Text('- $step'))
                    .toList()
                : [Text(recipe.instructions.toString())],
          ],
        ),
      ),
    );
  }
}
