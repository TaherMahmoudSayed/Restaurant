import 'package:flutter/material.dart';
import 'package:meals/items/categoryItem.dart';
import 'package:meals/models/category.dart';
import '../data/DummyData.dart';

class CategoriesPage extends StatelessWidget {
  static final routName='/categories';
  final List<Category> categoriesLsit = DUMMY_CATEGORIES;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: GridView(
          children: categoriesLsit
              .map((catgData) => CategoryItem(
                  title: catgData.title,
                  color: catgData.color,
                  id: catgData.id))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
