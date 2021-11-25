import 'package:flutter/material.dart';
import 'package:recipeapp/ui/cuisine_results.dart';

class CuisineItem extends StatelessWidget {
  final String cuisine;

  const CuisineItem({Key? key, required this.cuisine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CuisineResults(
                cuisine: cuisine,
              ),
            ),
          ),
        },
        child: ListTile(
          title: Text(cuisine),
        ),
      ),
    );
  }
}
