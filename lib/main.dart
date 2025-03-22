import 'package:flutter/material.dart';
import 'package:flutter_projects/routes/routes.dart';
import 'package:flutter_projects/shared/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Barback',
      theme: appTheme,
      routerConfig: router, // Use the imported router
      debugShowCheckedModeBanner: false,
    );
  }
}
