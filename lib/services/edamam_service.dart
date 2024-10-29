import 'dart:convert';
import 'package:http/http.dart' as http;

class EdamamService {
  final String appId = 'df3fb7f4';
  final String appKey = '80c6fb996b16753ac61ad25e5b641f4d';

  Future<List<dynamic>> searchRecipes(String query,
      {String additionalParams = ''}) async {
    final url = Uri.parse(
        'https://api.edamam.com/search?q=$query&app_id=$appId&app_key=$appKey$additionalParams');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['hits'];
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
