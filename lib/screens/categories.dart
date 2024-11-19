import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_gird_item.dart';
import 'package:meals/models/category.dart';

import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite, required this.availableMeals});

  final void Function (Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;


  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealsScreen(
            title: category.title,
            meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ))); // Navogator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return
       GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGirdItem(
              category: category,
              onSelectedCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      );

  }
}
