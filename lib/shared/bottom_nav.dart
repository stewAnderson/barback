import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: widget.onItemTapped,
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(FontAwesomeIcons.magnifyingGlass),
          label: 'Search',
        ),
        NavigationDestination(
          icon: Icon(FontAwesomeIcons.users),
          label: 'Social',
        ),
        NavigationDestination(
          icon: Icon(FontAwesomeIcons.house),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(FontAwesomeIcons.wineBottle),
          label: 'Inventory',
        ),
        NavigationDestination(
          icon: Icon(FontAwesomeIcons.solidHeart),
          label: 'Favorites',
        ),
      ],
    );
  }
}
