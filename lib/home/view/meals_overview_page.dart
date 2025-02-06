import 'package:flutter/material.dart';
import 'package:iss_mir_egal/home/data/meals_controller.dart';
import 'package:iss_mir_egal/home/models/meal.dart';
import 'package:iss_mir_egal/home/widgets/meal_card.dart';

class MealsOverviewPage extends StatefulWidget {
  const MealsOverviewPage({
    super.key,
    required this.mealsController,
  });

  final MealsController mealsController;

  @override
  State<MealsOverviewPage> createState() => _MealsOverviewPageState();
}

class _MealsOverviewPageState extends State<MealsOverviewPage> {
  @override
  Widget build(BuildContext context) {
    final meals = widget.mealsController.getAllMeals();
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: [
          // show meals
          // normale for schleife benutzeb
          for (final meal in meals) MealCard(meal: meal),
          // oder: .map funktion auf einer Liste aufrufen:
          // ...meals.map((e) => MealCard(meal: e)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // füge über unseren controller ein (test)Meal hinzu
            widget.mealsController.addMeal(
              Meal(
                title: 'title',
                cuisine: 'cuisine',
                location: 'location',
                price: 0,
                imageUrl: '',
              ),
            );
          });

          // für später (bottom sheet zeigen, welches uns ein meal erstellen lässt):
          // showModalBottomSheet(
          //     context: context,
          //     isScrollControlled: true,
          //     builder: (context) => AddMealBottomSheet());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddMealBottomSheet extends StatelessWidget {
  const AddMealBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.7,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(decoration: InputDecoration(labelText: 'Ort')),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Preis',
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                ),
                FilledButton(
                  onPressed: () {},
                  child: Text('Hinzufügen'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
