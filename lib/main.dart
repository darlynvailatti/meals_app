import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/my_state_app.dart';
import 'package:meals_app/pages/categories_page.dart';
import 'package:meals_app/pages/category_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  List<Category> _categories;
  List<Meal> _meals;

  @override
  Widget build(BuildContext context) {
    _initData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
      ),
      home:
        AppState(
          child: CategoriesPage(),
          categories: _categories,
          meals: _meals,
        ),
      routes: {
        CategoryPage.routName: (ctx) => CategoryPage(),
      },
    );
  }

  void _initData() {
    _categories = DummyData.categories;
    _meals = DummyData.getMeals(_categories);
  }
}
