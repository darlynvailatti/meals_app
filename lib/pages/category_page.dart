import 'package:flutter/material.dart';
import 'package:meals_app/meal_widget.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/my_state_app.dart';

class CategoryPage extends StatelessWidget {
  static const routName = '/category';

  @override
  Widget build(BuildContext context) {
    final categoryArg = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryArg.title),
        backgroundColor: categoryArg.color,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealWidget(categoryArg.meals[index]);
        },
        itemCount: categoryArg.meals.length,
      ),
    );
  }
}
