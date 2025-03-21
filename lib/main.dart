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
      ),

      home: Scaffold(
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
