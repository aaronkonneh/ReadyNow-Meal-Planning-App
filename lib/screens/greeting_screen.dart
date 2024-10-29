import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import 'search_screen.dart';
import 'allergy_screen.dart';

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("ReadyNow")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/ReadyNow_logo.webp',
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "What do you feel like eating today?",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Search for a meal...",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (recipeProvider.selectedAllergies.isEmpty) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const AllergyScreen()),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SearchScreen(query: _controller.text),
                    ),
                  );
                }
              },
              child: const Text("Search"),
            ),
            const SizedBox(height: 20),
            const Text(
              "Favorites",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: recipeProvider.favorites.entries.map((entry) {
                  return ListTile(
                    title: Text(entry.key),
                    subtitle: Text("Rating: ${entry.value} stars"),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
