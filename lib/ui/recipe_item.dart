import 'package:flutter/material.dart';
import 'package:recipeapp/model/recipe.dart';
import 'package:recipeapp/ui/recipe_result.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeItem({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeResult(
                recipe: recipe,
              ),
            ),
          )
        },
        child: Container(
          height: 450.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: NetworkImage(recipe.image),
              fit: BoxFit.cover,
            ),
          ),
          child: ListTile(
            title: Text(
              recipe.label,
              style: TextStyle(fontSize: 27.0),
            ),
          ),
        ),
      ),
    );
  }
}
