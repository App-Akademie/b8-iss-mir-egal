import 'package:flutter/material.dart';
import 'package:iss_mir_egal/home/models/meal.dart';
import 'package:iss_mir_egal/home/widgets/meal_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.meals, super.key});

  final List<Meal> meals;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iss mir egal'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: [
          // show meals
          for (final meal in widget.meals) MealCard(meal: meal)
        ],
      ),
    );
  }
}
