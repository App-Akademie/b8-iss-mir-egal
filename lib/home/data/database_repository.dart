import '../models/meal.dart';

// Unser abstraktes Database Repository
// Durch das abstract geben wir nur den "Bauplan" vor, welche Methoden andere Klasse implementieren müssen
// Die eigentliche Logik der einzelnen Methoden geschieht dann in den spezifischen Klassen, nicht hier
abstract class DatabaseRepository {
// Fügt ein Meal hinzu
  void addMeal(Meal meal);
  // gibt uns eine Liste an Meals zurück
  List<Meal> getMeals();

  // Löscht ein meal
  void deleteMeal(Meal meal);

  // Updated ein Meal (oldMeal) mit einem neuen (newMeal)
  void updateMeal(Meal oldMeal, Meal newMeal);
}
