import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipeapp/model/recipe.dart';
import 'package:recipeapp/model/recipe_list.dart';
import 'package:recipeapp/secrets.dart';
import 'package:recipeapp/ui/recipe_item.dart';

import 'package:http/http.dart' as http;

class CuisineResults extends StatefulWidget {
  final String cuisine;

  const CuisineResults({Key? key, required this.cuisine}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CuisineResultsState();
}

class _CuisineResultsState extends State<CuisineResults> {
  late Future<RecipeList> futureRecipes;

  Future<RecipeList> fetchRecipes() async {
    final response = await http.get(
      Uri.parse(
        'https://api.edamam.com/api/recipes/v2?type=public&q=recipe&app_id=${Secret.APP_ID}&app_key=${Secret.APP_KEY}&cuisineType=${widget.cuisine}',
      ),
    );

    if (response.statusCode == 200) {
      return RecipeList.fromJson(
        jsonDecode(
          Utf8Decoder().convert(response.body.codeUnits),
        ),
      );
    } else {
      throw Exception('Failed to query recipes');
    }
  }

  @override
  void initState() {
    super.initState();
    futureRecipes = fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.cuisine} Cuisine"),
      ),
      body: FutureBuilder<RecipeList>(
        future: futureRecipes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Recipe> recipes = snapshot.data!.list;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) => RecipeItem(
                recipe: recipes[index],
              ),
            );
          } else {
            return ListTile(
              title: Text('Getting recipes ready...'),
              tileColor: Colors.transparent,
            );
          }
        },
      ),
    );
  }
}
