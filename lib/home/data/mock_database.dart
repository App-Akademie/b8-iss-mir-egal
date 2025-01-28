import '../models/meal.dart';
import 'database_repository.dart';

// Unsere MockDatabase Implementierung. Dadurch dass sie unser abstraktes DatabaseRepository implementiert, müssen wir hier
// alle Methoden aus unserem DatabaseRepository implementieren.
// Wir verwenden erstmal eine einfache private Liste (_meals), um unsere "Datenbank" zu mocken.

class MockDatabase implements DatabaseRepository {
  final List<Meal> _meals = [];

  // fügt unserer Liste ein Meal hinzu
  @override
  void addMeal(Meal meal) {
    _meals.add(meal);
  }

// Löscht ein Meal aus unserer Liste
  @override
  void deleteMeal(Meal meal) {
    _meals.remove(meal);
  }

// gibt uns unsere Liste _meals zurück
  @override
  List<Meal> getMeals() {
    return _meals;
  }

// ändert ein Meal
  @override
  void updateMeal(Meal oldMeal, Meal newMeal) {
    if (_meals.contains(oldMeal)) {
      final index = _meals.indexOf(oldMeal);
      _meals[index] = newMeal;
    }
  }
}
