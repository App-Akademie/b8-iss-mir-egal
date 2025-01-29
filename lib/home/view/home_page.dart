import 'package:flutter/material.dart';
import 'package:iss_mir_egal/home/models/meal.dart';

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
      body: ListView(
        children: [
          // show meals
          for (final meal in widget.meals)
            ListTile(
              title: Text(meal.title),
            )
        ],
      ),
    );
  }
}
