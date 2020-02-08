

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/my_state_app.dart';
import 'package:meals_app/pages/category_page.dart';
import 'package:meals_app/models/category.dart';

class CategoryItemWidget extends StatelessWidget{

  final Category category;

  CategoryItemWidget(this.category);

  void onSelectCategory(BuildContext context){
    var _allMeals = AppState.of(context).meals;
    var _mealsOfCategory = _allMeals.where((m) => m
        .categories.contains(category),
    ).toList();

    category.meals = _mealsOfCategory;
    Navigator.of(context).pushNamed(
        CategoryPage.routName,
        arguments: category
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(category.title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

}