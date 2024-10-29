import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import 'greeting_screen.dart';

class RatingScreen extends StatefulWidget {
  final String recipeLabel;

  const RatingScreen({Key? key, required this.recipeLabel}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _rating = 3;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipeLabel),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "How was your meal?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isFavorite,
                  onChanged: (bool? value) {
                    setState(() {
                      _isFavorite = value ?? false;
                    });
                  },
                ),
                const Text("Save to Favorites"),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_isFavorite) {
                  recipeProvider.addFavorite(widget.recipeLabel, _rating);
                }
                // Navigate back to GreetingScreen and clear previous screens
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const GreetingScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text("Submit & Go to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
