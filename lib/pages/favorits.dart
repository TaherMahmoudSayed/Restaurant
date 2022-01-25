import 'package:flutter/cupertino.dart';
import 'package:meals/items/mealItem.dart';
import 'package:meals/models/meal.dart';

class Favorites extends StatelessWidget {
  static final routName='/favorites';
  final List<Meal> favoritMeal;
  Favorites(this.favoritMeal);
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Center(
        child: favoritMeal.length==0?Text('Add your favorits'): ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: favoritMeal[index].id,
              affordability: favoritMeal[index].affordability,
              complexity: favoritMeal[index].complexity,
              duration: favoritMeal[index].duration,
              imageUrl: favoritMeal[index].imageUrl,
              title: favoritMeal[index].title,
              //deleteMeal: deleteMeal,
            );
          },
          itemCount: favoritMeal.length,
        ),
      ),
    );
  }
}
