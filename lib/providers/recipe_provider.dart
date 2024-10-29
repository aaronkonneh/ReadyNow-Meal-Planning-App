import 'package:flutter/material.dart';
import '../services/edamam_service.dart';

class RecipeProvider with ChangeNotifier {
  final EdamamService _edamamService = EdamamService();
  List<dynamic> _recipes = [];
  final Map<String, dynamic> _favorites = {};
  List<String> _selectedAllergies = [];

  // Getter for recipes
  List<dynamic> get recipes => _recipes;

  // Getter for favorites
  Map<String, dynamic> get favorites => _favorites;

  // Getter for selectedAllergies
  List<String> get selectedAllergies => _selectedAllergies;

  // Method to set allergies
  void setAllergies(List<String> allergies) {
    _selectedAllergies = allergies;
    notifyListeners();
  }

  Future<void> searchRecipes(String query) async {
    final allergyParams = _selectedAllergies
        .map((allergy) {
          switch (allergy) {
            case 'Peanuts':
              return 'peanut-free';
            case 'Tree Nuts':
              return 'tree-nut-free';
            case 'Dairy':
              return 'dairy-free';
            case 'Gluten':
              return 'gluten-free';
            case 'Shellfish':
              return 'shellfish-free';
            default:
              return '';
          }
        })
        .where((param) => param.isNotEmpty)
        .join('&health=');

    // Construct API URL with allergy filters
    final queryParams =
        allergyParams.isNotEmpty ? '&health=$allergyParams' : '';
    _recipes = await _edamamService.searchRecipes(query,
        additionalParams: queryParams);
    notifyListeners();
  }

  void addFavorite(String recipeLabel, int rating) {
    _favorites[recipeLabel] = rating;
    notifyListeners();
  }
}
