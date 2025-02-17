import 'package:iss_mir_egal/home/data/database_repository.dart';
import 'package:iss_mir_egal/home/models/meal.dart';

class MealsController {
  final DatabaseRepository _databaseRepository;
  MealsController(this._databaseRepository);

// alter synchroner aufruf um unsere meals zu bekommen
  List<Meal> getAllMeals() => _databaseRepository.getMeals();

  Future<List<Meal>> getAllMealsFuture() => Future.delayed(
        Duration(seconds: 3),
        () => _databaseRepository.getMeals(),
      );

  void addMeal(Meal meal) => _databaseRepository.addMeal(meal);
}
