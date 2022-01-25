import 'package:flutter/material.dart';
import 'package:meals/pages/bottomTabsScreen.dart';

import 'package:meals/pages/categoryMealsPage.dart';
import 'package:meals/pages/favorits.dart';
import 'package:meals/pages/filtersPage.dart';
import 'package:meals/pages/mealDetails.dart';
import 'package:meals/pages/tabsScreen.dart';

import 'data/DummyData.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> currentMeals = DUMMY_MEALS;
  List<Meal> favoritMeals = [];

  void saveFilters(Map<String, bool> filterData) {
    setState(() {});
    filters = filterData;
    currentMeals = DUMMY_MEALS.where((meal) {
      if (filters['gluten'] as bool && !meal.isGlutenFree) {
        return false;
      }
      if (filters['lactose'] as bool && !meal.isLactoseFree) {
        return false;
      }
      if (filters['vegan'] as bool && !meal.isVegan) {
        return false;
      }
      if (filters['vegetarian'] as bool && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  void toggleFavorites(String mealId) {
    var isExistedMeal = favoritMeals.indexWhere((meal) => meal.id == mealId);
    if (isExistedMeal == -1) {
      setState(() {
        favoritMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    } else {
      setState(() {
        favoritMeals.removeAt(isExistedMeal);
      });
    }
  }

  bool isMealFavorit(String mealId) {
    return favoritMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline1: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: "RobotoCondensed",
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //home: TabsScreen(favoritMeals),
      home: BottomTabsScreen(favoritMeals),
      routes: {
        CategoryMealsPage.categoryMealsRout: (ctx) =>
            new CategoryMealsPage(currentMeals),
        MealDetails.mealDetailsRout: (ctx) =>
            new MealDetails(toggleFavorites, isMealFavorit),
        Filters.routeName: (ctx) => new Filters(filters, saveFilters),
      },
    );
  }
}
