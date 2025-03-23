import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipeScreen extends StatefulWidget {
  final String recipeName;

  const RecipeScreen({super.key, required this.recipeName});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final DatabaseReference db = FirebaseDatabase.instance.ref();
  Map<String, dynamic>? recipe;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecipe();
  }

  Future<void> fetchRecipe() async {
    try {
      final snapshot = await db
          .child('recipes')
          .orderByChild('name')
          .equalTo(widget.recipeName)
          .limitToFirst(1)
          .get();
      if (snapshot.exists) {
        final Map<dynamic, dynamic> recipesMap =
            snapshot.value as Map<dynamic, dynamic>;
        final recipeDetails =
            Map<String, dynamic>.from(recipesMap.values.first);
        setState(() {
          recipe = recipeDetails;
          isLoading = false;
        });
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
        title: Text(recipe!['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Text(
              'Ingredients: ${recipe!['ingredients'].join(', ')}',
              // style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Instructions: ${recipe!['instructions']}',
              // style: Theme.of(context).textTheme.bodyText1,
            ),
            // Add more UI elements here as needed
          ],
        ),
      ),
    );
  }
}
