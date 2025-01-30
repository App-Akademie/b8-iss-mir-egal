import 'package:flutter/material.dart';
import 'package:iss_mir_egal/home/models/meal.dart';
import 'package:iss_mir_egal/home/view/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.meals, super.key});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        meals: meals,
      ),
    );
  }
}
