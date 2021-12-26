import 'package:flutter/material.dart';
import 'package:recipeapp/model/recipe.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeUrlView extends StatelessWidget {
  final Recipe recipe;

  const RecipeUrlView({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.label),
      ),
      body: WebView(
        initialUrl: recipe.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
