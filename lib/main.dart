import 'package:flutter/material.dart';
import 'package:flutter_projects/home/home.dart';
import 'package:flutter_projects/search/search.dart';
import 'package:flutter_projects/social/social.dart';
import 'package:flutter_projects/inventory/inventory.dart';
import 'package:flutter_projects/favorites/favorites.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/search': (context) => const SearchScreen(),
        '/social': (context) => const SocialScreen(),
        '/inventory': (context) => const InventoryScreen(),
        '/favorites': (context) => const FavoritesScreen(),
      },
    );
  }
}
