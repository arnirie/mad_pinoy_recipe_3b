import 'package:flutter/material.dart';
import 'package:mad_pinoy_recipes_3b/models/recipe.dart';

class RecipeViewScreen extends StatelessWidget {
  RecipeViewScreen(this.recipe, {super.key});

  Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: ListView(
        children: [
          if (recipe.imageUrl != null)
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: AspectRatio(
                aspectRatio: 3 / 2,
                child: Image.network(
                  recipe.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Ingredients',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          if (recipe.ingredients != null)
            ...recipe.ingredients!
                .map((item) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: Text('• $item'),
                    ))
                .toList()
          else
            Text('No Ingredients'),
          Text(
            'Steps',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          if (recipe.steps != null)
            ...recipe.steps!
                .map(
                  (item) => Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item),
                    ),
                  ),
                )
                .toList(),
        ],
      ),
    );
  }
}
