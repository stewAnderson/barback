import 'package:flutter/material.dart';
import 'package:flutter_projects/inventory/recipe_list.dart';
import 'package:flutter_projects/inventory/recipe.dart'; // Adjust the import path as necessary
import 'package:go_router/go_router.dart';
import 'package:flutter_projects/favorites/favorites.dart';
import 'package:flutter_projects/home/home.dart';
import 'package:flutter_projects/inventory/inventory.dart';
import 'package:flutter_projects/search/search.dart';
import 'package:flutter_projects/social/social.dart';
import 'package:flutter_projects/shared/bottom_nav.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomNav(navigationShell: navigationShell),
        );
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(),
          routes: <RouteBase>[
            GoRoute(
              path: '/search',
              builder: (context, state) => const SearchScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(),
          routes: <RouteBase>[
            GoRoute(
              path: '/social',
              builder: (context, state) => const SocialScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(),
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(),
          routes: <RouteBase>[
            GoRoute(
              path: '/inventory',
              builder: (context, state) => const InventoryScreen(),
              routes: [
                GoRoute(
                  path: 'recipe_list',
                  builder: (context, state) => const RecipeListScreen(),
                ),
                GoRoute(
                  path: 'recipe',
                  builder: (context, state) {
                    final recipeName = state.extra as String;
                    return RecipeScreen(recipeName: recipeName);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: GlobalKey<NavigatorState>(),
          routes: <RouteBase>[
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
