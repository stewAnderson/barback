import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExpandedMenu extends StatelessWidget {
  const ExpandedMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 218, 218, 218),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 206, 206, 206), width: 1.0),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(46, 251, 145, 1),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.all(16.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                        ),
                        onPressed: () {
                          context.go('/inventory/recipe_list');
                        },
                        child: const Text('Recipes'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.all(16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Where to find'),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(16.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Add to Inventory'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
