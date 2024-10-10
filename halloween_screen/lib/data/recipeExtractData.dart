// ignore: file_names
import 'dart:convert';
import 'package:flutter/services.dart';

class RecipeExtractData {
  final String nameRecipe;
  final String imgRecipe;
  final String difficultyRecipe;

  RecipeExtractData({
      required this.nameRecipe,
      required this.difficultyRecipe,
      required this.imgRecipe
  });

  factory RecipeExtractData.fromJson(Map<String, dynamic> json) {
    return RecipeExtractData(
      nameRecipe: json['nameRecipe'] ?? '',
      imgRecipe: json['image'] ?? '',
      difficultyRecipe: json['difficulty'] ?? '',
    );
  }

  static Future<List<RecipeExtractData>> recipeAll() async {
    var response = await rootBundle.loadString('assets/api/recipeJson.json');
    if (response.isNotEmpty) {
      List<dynamic> jsonResponse = jsonDecode(response);
      return jsonResponse
          .map((json) => RecipeExtractData.fromJson(json))
          .toList();
    } else {
      return [];
    }
  }
}
