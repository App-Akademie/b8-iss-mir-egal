import 'package:iss_mir_egal/home/data/meals.mock.dart';

import '../models/meal.dart';
import 'database_repository.dart';

// Unsere MockDatabase Implementierung. Dadurch dass sie unser abstraktes DatabaseRepository implementiert, müssen wir hier
// alle Methoden aus unserem DatabaseRepository implementieren.
// Wir verwenden erstmal eine einfache private Liste (_meals), um unsere "Datenbank" zu mocken.

class MockDatabase implements DatabaseRepository {
  final List<Meal> _meals = [
    ...meals,
  ];

  // fügt unserer Liste ein Meal hinzu
  @override
  Future<void> addMeal(Meal meal) async {
    _meals.add(meal);
  }

// Löscht ein Meal aus unserer Liste
  @override
  Future<void> deleteMeal(Meal meal) async {
    _meals.remove(meal);
  }

// gibt uns unsere Liste _meals zurück
  @override
  Future<List<Meal>> getMeals() {
    return Future.delayed(Duration(seconds: 3), () => _meals);
  }

// ändert ein Meal
  @override
  Future<void> updateMeal(Meal oldMeal, Meal newMeal) async {
    if (_meals.contains(oldMeal)) {
      final index = _meals.indexOf(oldMeal);
      _meals[index] = newMeal;
    }
  }
}
