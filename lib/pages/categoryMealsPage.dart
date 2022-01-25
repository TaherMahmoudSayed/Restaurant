import 'package:flutter/material.dart';
// import 'package:meals/data/DummyData.dart';
import 'package:meals/items/mealItem.dart';
import 'package:meals/models/meal.dart';

class CategoryMealsPage extends StatefulWidget {
  static final String categoryMealsRout = '/categoryMealsPage';
 final List<Meal> availableMeals;
CategoryMealsPage( this.availableMeals);

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  List<Meal> categoryMeals= [];
  bool didChanged = false;
  String categoryId = '';
  
  void deleteMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    
      print(didChanged);
//this if statement will be entered only the first time this widget is created; 
    if (!didChanged) {
      final routArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryId = routArgs['id'].toString();
      //get all meals of a specific category from dummyMeals List by categoryId
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      didChanged = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryId),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: categoryMeals[index].id,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
             // deleteMeal: deleteMeal,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
