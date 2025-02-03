import 'package:flutter/material.dart';
import 'package:iss_mir_egal/home/models/meal.dart';
import 'package:iss_mir_egal/home/view/home_page.dart';
import 'package:iss_mir_egal/styles/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.meals, super.key});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();
    return MaterialApp(
      theme: appTheme.theme,
      darkTheme: appTheme.darkTheme,
      home: HomePage(
        meals: meals,
      ),
    );
  }
}
