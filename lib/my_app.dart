import 'package:flutter/material.dart';
import 'package:iss_mir_egal/auth/view/login_page.dart';
import 'package:iss_mir_egal/auth/view/signup_page.dart';
import 'package:iss_mir_egal/home/data/auth_repository.dart';
import 'package:iss_mir_egal/home/data/meals_controller.dart';
import 'package:iss_mir_egal/home/view/home_page.dart';
import 'package:iss_mir_egal/styles/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp(
      {required this.mealsController, required this.authController, super.key});

  final MealsController mealsController;
  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();
    return MaterialApp(
      theme: appTheme.theme,
      darkTheme: appTheme.darkTheme,
      home: HomePage(mealsController: mealsController),
    );
  }
}
