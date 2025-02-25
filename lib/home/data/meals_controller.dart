import 'package:iss_mir_egal/home/data/database_repository.dart';
import 'package:iss_mir_egal/home/models/meal.dart';

class MealsController {
  final DatabaseRepository _databaseRepository;
  MealsController(this._databaseRepository);

// neuer asynchroner aufruf um unsere meals zu bekommen
  Future<List<Meal>> getAllMeals() => _databaseRepository.getMeals();

  void addMeal(Meal meal) => _databaseRepository.addMeal(meal);
}
