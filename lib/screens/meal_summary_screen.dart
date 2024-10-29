import 'package:flutter/material.dart';

class MealSummaryScreen extends StatelessWidget {
  const MealSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meal Review")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("How would you rate this recipe?"),
            // Rating widget here
            ElevatedButton(
              onPressed: () {
                // Handle save to favorites
              },
              child: const Text("Save to Favorites"),
            ),
          ],
        ),
      ),
    );
  }
}
