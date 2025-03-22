import 'package:flutter/material.dart';
import 'package:flutter_projects/inventory/expanded_menu.dart';
import 'package:flutter_projects/shared/search_bar.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(
      dividerColor: Colors.transparent,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          itemCount: 2, // Adjust the item count as needed
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            if (index == 0) {
              return const MySearchBar(hintText: 'Search Inventory...');
            } else {
              return Theme(
                data: theme,
                child: ExpansionTile(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(255, 197, 197, 197)),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  collapsedShape: const RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(255, 197, 197, 197)),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  backgroundColor: const Color.fromARGB(255, 218, 218, 218),
                  collapsedBackgroundColor: Colors.white,
                  title: Text('Aperol',
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text('500mL',
                  style: Theme.of(context).textTheme.titleSmall),
                  children: const [
                    SizedBox(
                      height: 130.0,
                      child: ExpandedMenu(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
