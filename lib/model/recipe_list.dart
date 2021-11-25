import 'package:recipeapp/model/recipe.dart';

class RecipeList {
  final List<Recipe> list;

  RecipeList({required this.list});

  factory RecipeList.fromJson(Map<String, dynamic> json) {
    return RecipeList(
      list: List.from(json['hits'])
          .map((recipe) => Recipe.fromJson(recipe['recipe']))
          .toList(),
    );
  }
}
