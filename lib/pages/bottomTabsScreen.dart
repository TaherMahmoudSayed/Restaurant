import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/sideDrawer.dart';
import '../pages/categoriesPage.dart';
import '../pages/favorits.dart';

class BottomTabsScreen extends StatefulWidget {
  List<Meal> favoritMeals;
  BottomTabsScreen(this.favoritMeals);
  @override
  _BottomTabsScreenState createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  List<Map<String, Object>> pages = [];
  @override
  void initState() {
    pages = [
      {'page': CategoriesPage(), 'title': 'Categories'},
      {'page': Favorites(widget.favoritMeals), 'title': 'Your Favorites'}
    ];
    super.initState();
  }

  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
    // Navigator.of(context).pushNamed(_pages[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'] as String),
      ),
      drawer: SideDrawer(),
      body: pages[selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => selectPage(index),
        currentIndex: this.selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
