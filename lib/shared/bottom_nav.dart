import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int myIndex = 2;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: myIndex,
      onDestinationSelected: (int index) {
        setState(() {
          myIndex = index;
        });
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/search');
            break;
          case 1:
            Navigator.pushNamed(context, '/social');
            break;
          case 2:
            Navigator.pushNamed(context, '/');
            break;
          case 3:
            Navigator.pushNamed(context, '/inventory');
            break;
          case 4:
            Navigator.pushNamed(context, '/favorites');
            break;
        }
      },
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
          icon: Icon(FontAwesomeIcons.heart),
          label: 'Favorites',
        ),
      ],
    );
  }
}
