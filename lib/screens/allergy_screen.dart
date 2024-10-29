import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import 'search_screen.dart';

class AllergyScreen extends StatefulWidget {
  const AllergyScreen({Key? key}) : super(key: key);

  @override
  _AllergyScreenState createState() => _AllergyScreenState();
}

class _AllergyScreenState extends State<AllergyScreen> {
  final Map<String, bool> allergies = {
    'Peanuts': false,
    'Shellfish': false,
    'Tree Nuts': false,
    'Dairy': false,
    'Gluten': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Allergy Preferences")),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const Text("Do you have any of these common allergies?"),
          ...allergies.keys.map((allergy) {
            return CheckboxListTile(
              title: Text(allergy),
              value: allergies[allergy],
              onChanged: (value) {
                setState(() {
                  allergies[allergy] = value!;
                });
              },
            );
          }).toList(),
          ElevatedButton(
            onPressed: () {
              final selectedAllergies = allergies.entries
                  .where((entry) => entry.value)
                  .map((entry) => entry.key)
                  .toList();
              Provider.of<RecipeProvider>(context, listen: false)
                  .setAllergies(selectedAllergies);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const SearchScreen(query: ''),
                ),
              );
            },
            child: const Text("Save Preferences"),
          ),
        ],
      ),
    );
  }
}
