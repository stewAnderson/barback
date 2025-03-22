import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final dynamic navigationShell;

  const BottomNav({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      destinations: [
        _buildNavDestination(Icons.search, 'Search',
            navigationShell.currentIndex == 0, Colors.black),
        _buildNavDestination(Icons.people, 'Social',
            navigationShell.currentIndex == 1, Colors.purple),
        _buildNavDestination(Icons.home, 'Home',
            navigationShell.currentIndex == 2, Colors.greenAccent),
        _buildNavDestination(Icons.inventory, 'Inventory',
            navigationShell.currentIndex == 3, Colors.blue[600]!),
        _buildNavDestination(Icons.favorite, 'Favorites',
            navigationShell.currentIndex == 4, Colors.red),
      ],
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: (int index) {
        if (index == navigationShell.currentIndex) {
          // Navigate back to the initial page of the current nav item
          navigationShell.goBranch(index, initialLocation: true);
        } else {
          // Navigate to the selected index
          navigationShell.goBranch(index);
        }
      },
    );
  }

  NavigationDestination _buildNavDestination(
      IconData icon, String label, bool isSelected, Color selectedColor) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: isSelected ? selectedColor : Colors.grey,
      ),
      label: label,
    );
  }
}
