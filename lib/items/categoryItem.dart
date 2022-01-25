import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/pages/categoryMealsPage.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {required this.title, required this.color, required this.id});
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(CategoryMealsPage.categoryMealsRout, arguments: {
      'id': this.id,
      'title': this.title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [this.color.withOpacity(0.7), this.color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
