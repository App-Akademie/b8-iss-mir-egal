import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iss_mir_egal/gen/assets.gen.dart';
import 'package:iss_mir_egal/home/models/meal.dart';
import 'package:iss_mir_egal/home/widgets/meal_card.dart';
import 'package:iss_mir_egal/styles/app_colors.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({required this.allMeals, super.key});

  final List<Meal> allMeals;

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  Meal? meal;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Was soll ich heute essen?',
              style: TextTheme.of(context).headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surfacecontainer.withAlpha(
                  100,
                ),
              ),
              child: meal == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Assets.images.logo.image(height: 120),
                        Text(
                          'Drücke auf den Button!',
                          style: TextTheme.of(context).labelSmall,
                        )
                      ],
                    )
                  : MealCard(meal: meal!),
            ),
            SizedBox(
              height: 24,
            ),
            FilledButton(
              onPressed: () {
                // erstelle eine zufällige zahl zwischen 0 und der länge unserer meals liste
                int randomIndex = Random().nextInt(widget.allMeals.length);
                // setze unser meal im state
                setState(() {
                  meal = widget.allMeals[randomIndex];
                });
              },
              child: Text('Gib mir einen Vorschlag!'),
            ),
            TextButton(
              onPressed: () {
                // setze das meal im state auf null zurück
                setState(() {
                  meal = null;
                });
              },
              child: Text('Zurücksetzen'),
            )
          ],
        ),
      ),
    );
  }
}
