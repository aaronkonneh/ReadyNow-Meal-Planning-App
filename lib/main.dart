import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/greeting_screen.dart';
import 'providers/recipe_provider.dart';
import 'screens/allergy_screen.dart';
import 'screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
      ],
      child: MaterialApp(
        title: 'ReadyNow Meal Prep App',
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/',
        routes: {
          '/': (context) => const GreetingScreen(),
          '/allergies': (context) => const AllergyScreen(),
          '/search': (context) =>
              SearchScreen(query: ''), // default empty query
        },
      ),
    );
  }
}
