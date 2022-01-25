import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/pages/categoriesPage.dart';
import 'package:meals/pages/favorits.dart';

class TabsScreen extends StatelessWidget {
  final List<Meal> favoritMeals;
  TabsScreen(this.favoritMeals);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category), text: "Category"),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesPage(),
            Favorites(favoritMeals),
          ],
        ),
      ),
    );
  }
}
