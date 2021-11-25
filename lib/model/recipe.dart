class Recipe {
  final String uri;
  final String label;
  final String image;
  final String source;
  final String url;
  final String shareAs;
  final List<String> dietLabels;
  final List<String> ingredientLines;
  final List<String> mealType;
  final List<String> dishType;

  Recipe({
    required this.uri,
    required this.label,
    required this.image,
    required this.source,
    required this.url,
    required this.shareAs,
    required this.dietLabels,
    required this.ingredientLines,
    required this.mealType,
    required this.dishType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      uri: json['uri'],
      label: json['label'],
      image: json['image'],
      source: json['source'],
      url: json['url'],
      shareAs: json['shareAs'],
      dietLabels:
          json['dietLabels'].map<String>((label) => label as String).toList(),
      ingredientLines: json['ingredientLines']
          .map<String>((ingredient) => ingredient as String)
          .toList(),
      mealType: json['mealType']
          .map<String>((mealType) => mealType as String)
          .toList(),
      dishType: json['dishType']
          .map<String>((dishType) => dishType as String)
          .toList(),
    );
  }
}
