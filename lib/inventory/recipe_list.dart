import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_projects/inventory/recipe.dart'; // Adjust the import path as necessary

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final DatabaseReference db = FirebaseDatabase.instance.ref();
  List<Map<String, dynamic>> recipes = []; // Change to store additional details
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    try {
      final snapshot = await db.child('recipes').get();
      if (snapshot.exists) {
        final Map<dynamic, dynamic> recipesMap =
            snapshot.value as Map<dynamic, dynamic>;
        final List<Map<String, dynamic>> recipesList =
            recipesMap.entries.map((entry) {
          return {
            'id': entry.key,
            'name': entry.value['name'] as String,
          };
        }).toList();
        setState(() {
          recipes = recipesList;
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
      print('Error fetching recipes: $e');
    }
  }

  void navigateToRecipePage(String recipeName) {
    if (recipeName != null) {
      context.go('/inventory/recipe', extra: recipeName);
    } else {
      print('Error: Recipe name is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe List"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : recipes.isEmpty
              ? const Center(child: Text("No recipes available"))
              : ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: InkWell(
                        onTap: () =>
                            navigateToRecipePage(recipes[index]['name']),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            recipes[index]['name'],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
