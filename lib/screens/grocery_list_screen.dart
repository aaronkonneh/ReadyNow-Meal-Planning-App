import 'package:flutter/material.dart';

class GroceryListScreen extends StatelessWidget {
  final List<String> ingredients;
  const GroceryListScreen({Key? key, required this.ingredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grocery Checklist")),
      body: ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(ingredients[index]),
            value: false,
            onChanged: (bool? value) {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to meal preparation steps
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
