import 'package:flutter/material.dart';
import 'package:recipeapp/model/recipe.dart';

class RecipeResult extends StatelessWidget {
  final Recipe recipe;

  const RecipeResult({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    recipe.image,
                    fit: BoxFit.cover,
                    gaplessPlayback: true,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, 1.0),
                        stops: [0.0, 0.3, 0.5, 1.0],
                        colors: [
                          Theme.of(context).scaffoldBackgroundColor,
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.0),
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.0),
                          Theme.of(context).scaffoldBackgroundColor
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(recipe.label),
              titlePadding: const EdgeInsets.only(left: 15),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text(recipe.ingredientLines[index]),
                );
              },
              childCount: recipe.ingredientLines.length,
            ),
          ),
        ],
      ),
    );
  }
}
