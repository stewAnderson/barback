import 'package:flutter/material.dart';
import 'package:flutter_projects/shared/bottom_nav.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const BottomNavBar(),
      body: const Center(
        child: Text('Inventory Screen'),
      ),
    );
  }
}