import 'package:flutter/material.dart';
import 'package:iss_mir_egal/home/data/auth_repository.dart';
import 'package:iss_mir_egal/home/data/database_repository.dart';
import 'package:iss_mir_egal/home/data/meals_controller.dart';
import 'package:iss_mir_egal/home/data/mock_database.dart';

import 'package:iss_mir_egal/my_app.dart';

void main() {
  // holt unsere mock database mit unseren meals
  DatabaseRepository mockDatabase = MockDatabase();

  // für demnonstrationszwecke auch ein Auth repository erstellen:
  AuthRepository mockAuth = MockAuthRepository();

  // wir nutzen unseren MealsController, der eine Instanz von unserem Repository hält.
  // Den MealsController geben wir in unserem WidgetTree mit. Er bildet den zwischen Layer zwischen UI
  // und unseren Schnittstellen/Repositories.
  final MealsController mealsController = MealsController(mockDatabase);

  // erstelle einen AuthController
  final AuthController authController = AuthController(mockAuth);

  runApp(
    MyApp(
      mealsController: mealsController,
      authController: authController,
    ),
  );
}
