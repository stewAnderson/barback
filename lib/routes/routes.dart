import 'package:flutter_projects/favorites/favorites.dart';
import 'package:flutter_projects/home/home.dart';
import 'package:flutter_projects/inventory/inventory.dart';
import 'package:flutter_projects/recipe/recipe.dart';
import 'package:flutter_projects/search/search.dart';
import 'package:flutter_projects/social/social.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/inventory': (context) => const InventoryScreen(),
  '/recipe': (context) => const RecipeScreen(),
  '/social': (context) => const SocialScreen(),
  '/favorites': (context) => const FavoritesScreen(),
  '/search': (context) => const SearchScreen(),
};
