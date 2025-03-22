import 'package:flutter/material.dart';
import 'package:flutter_projects/shared/search_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Set padding to 20
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 60.0, // Increase top padding
                bottom: 10.0,
              ), // Add padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Barback',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Row(
                    children: [
                      Icon(FontAwesomeIcons.solidUser, color: Colors.black),
                      SizedBox(width: 28),
                      Icon(FontAwesomeIcons.gear, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
              alignment: Alignment.centerLeft, // Align text to the left
              child: SizedBox(
                width: MediaQuery.of(context).size.width *
                    2 /
                    3, // Set width to 2/3 of the screen width
                child: Text(
                  'Whats on the menu today?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: const MySearchBar(hintText: 'Try something new?',)),
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Cocktail',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10.0), // Set desired border radius
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      color: const Color.fromARGB(255, 207, 207, 207),
                      width: double
                          .infinity, // Set width to fill the available space
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 200,
                            width: double.infinity,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Classic Whisky Sour',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              OutlinedButton(
                                onPressed:
                                    () {}, // Empty function for placeholder
                                style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      Colors.white, // Button background color
                                  side: const BorderSide(
                                      color: Colors.black), // Border color
                                ),
                                child: const Text('Make it'),
                              ),
                            ],
                          )
                          // Image.asset('lib/assets/images/sour.jpg'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
