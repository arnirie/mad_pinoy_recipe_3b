import 'package:flutter/material.dart';
import 'package:mad_pinoy_recipes_3b/components/category_tile.dart';
import 'package:mad_pinoy_recipes_3b/data/back_data.dart';

class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({super.key});

  final categoryList = CATEGORIES;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinoy Recipes'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        children: categoryList.map((elem) {
          return CategoryTile(
            category: elem,
          );
        }).toList(),
      ),
    );
  }
}
