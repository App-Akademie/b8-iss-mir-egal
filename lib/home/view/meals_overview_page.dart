import 'package:flutter/material.dart';
import 'package:iss_mir_egal/home/models/meal.dart';
import 'package:iss_mir_egal/home/widgets/meal_card.dart';

class MealsOverviewPage extends StatelessWidget {
  const MealsOverviewPage({
    super.key,
    required this.meals,
  });

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: [
        // show meals
        for (final meal in meals) MealCard(meal: meal)
      ],
    );
  }
}
