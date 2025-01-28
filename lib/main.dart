import 'package:flutter/material.dart';
import 'package:iss_mir_egal/home/data/database_repository.dart';
import 'package:iss_mir_egal/home/data/mock_database.dart';
import 'package:iss_mir_egal/home/models/meal.dart';
import 'package:iss_mir_egal/my_app.dart';

void main() {
  // holt unsere mock database mit unseren meals
  DatabaseRepository mockDatabase = MockDatabase();

// sammelt schonmal alle meals damit wir sie im widget tree übergeben können
// wir könnten alternativ auch das repository mitgeben, das versucht man aber in der regel zu vermeiden
// später wenn wir uns um state management kümmern, werde wir das nochmal anpassen
  final List<Meal> allMeals = mockDatabase.getMeals();

  runApp(
    MyApp(
      meals: allMeals,
    ),
  );
}
