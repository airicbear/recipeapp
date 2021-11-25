import 'package:flutter/material.dart';

import 'package:recipeapp/ui/cuisine_item.dart';

class CuisineList extends StatelessWidget {
  final List<String> cuisines = [
    "American",
    "Asian",
    "British",
    "Caribbean",
    "Central Europe",
    "Chinese",
    "Eastern Europe",
    "French",
    "Indian",
    "Italian",
    "Japanese",
    "Kosher",
    "Mediterranean",
    "Mexican",
    "Middle Eastern",
    "Nordic",
    "South American",
    "South East Asian",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cuisines.length,
      itemBuilder: (context, index) {
        return CuisineItem(
          cuisine: cuisines[index],
        );
      },
    );
  }
}
