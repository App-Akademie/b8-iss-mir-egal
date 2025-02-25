import 'package:iss_mir_egal/home/models/user.dart';

import '../models/meal.dart';

// Unser abstraktes Database Repository
// Durch das abstract geben wir nur den "Bauplan" vor, welche Methoden andere Klasse implementieren müssen
// Die eigentliche Logik der einzelnen Methoden geschieht dann in den spezifischen Klassen, nicht hier
abstract class DatabaseRepository {
// Fügt ein Meal hinzu
  Future<void> addMeal(Meal meal);
  // gibt uns eine Liste an Meals zurück
  Future<List<Meal>> getMeals();

  // Löscht ein meal
  Future<void> deleteMeal(Meal meal);

  // Updated ein Meal (oldMeal) mit einem neuen (newMeal)
  Future<void> updateMeal(Meal oldMeal, Meal newMeal);
}
