import 'package:flutter/material.dart';
import 'package:flutter_projects/routes/routes.dart';
import 'package:flutter_projects/shared/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final Map<int, Color> _iconColors = {
    0: Colors.grey,
    1: Colors.deepPurple,
    2: Colors.green,
    3: Colors.blue,
    4: Colors.red,
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: Colors.transparent, // Remove indicator
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: _iconColors[_selectedIndex]);
            }
            return const IconThemeData(
                color: Colors.grey); // Default icon color
          }),
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(
                color: Colors.black), // Change to desired label color
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'), // Add your desired title here
          automaticallyImplyLeading: true, // Ensure back button is shown
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            appRoutes['/search']!(context),
            appRoutes['/social']!(context),
            appRoutes['/']!(context),
            appRoutes['/inventory']!(context),
            appRoutes['/favorites']!(context),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          onItemTapped: _onItemTapped,
          selectedIndex: _selectedIndex,
        ),
      ),
    );
  }
}
