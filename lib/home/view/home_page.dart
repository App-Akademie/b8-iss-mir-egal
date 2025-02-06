import 'package:flutter/material.dart';
import 'package:iss_mir_egal/home/data/meals.mock.dart';
import 'package:iss_mir_egal/home/data/meals_controller.dart';

import 'package:iss_mir_egal/home/models/meal.dart';
import 'package:iss_mir_egal/home/view/meals_overview_page.dart';
import 'package:iss_mir_egal/home/view/profile_page.dart';
import 'package:iss_mir_egal/home/view/suggestion_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.mealsController, super.key});

  final MealsController mealsController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      SuggestionPage(allMeals: widget.mealsController.getAllMeals()),
      MealsOverviewPage(mealsController: widget.mealsController),
      ProfilePage(),
    ];
    return Scaffold(
      body: pages[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeIndex,
        onTap: (value) => setState(() {
          activeIndex = value;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Übersicht',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
