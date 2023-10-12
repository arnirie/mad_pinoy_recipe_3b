import 'package:flutter/material.dart';
import 'package:mad_pinoy_recipes_3b/components/recipe_tile.dart';
import 'package:mad_pinoy_recipes_3b/data/back_data.dart';
import 'package:mad_pinoy_recipes_3b/models/category.dart';

class RecipeListScreen extends StatelessWidget {
  RecipeListScreen({super.key, required this.category});

  Category category;

  var recipesList = [];

  @override
  Widget build(BuildContext context) {
    recipesList =
        RECIPES.where((recipe) => recipe.categoryId == category.id).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        centerTitle: true,
        backgroundColor: category.color,
      ),
      body: ListView.builder(
        itemCount: recipesList.length,
        itemBuilder: (_, index) {
          return RecipeTile(recipesList[index]);
        },
      ),
    );
  }
}
