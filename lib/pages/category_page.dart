import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/widgets/meal_widget.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/my_state_app.dart';

class CategoryPage extends StatefulWidget {
  static const routName = '/category';

  @override
  State<StatefulWidget> createState() {
    return _CategoryPageState();
  }
}

class _CategoryPageState extends State<CategoryPage>{

  Category _categoryArg;

  @override
  void initState() {
    super.initState();
  }

  void deleteMeal(Meal mealToDelete, Category category){
    setState(() {
      print('deleting meal...');
      var meals = AppState.of(context).dataIndex.meals;
      meals.removeWhere((meal) {
        return meal.id == mealToDelete.id;
      });
      category.meals.removeWhere((meal) {
        return meal.id == mealToDelete.id;
      });
    });
  }

  void addMealToFavorites(Meal mealToAddAsFavorite){
    setState(() {
      AppState.of(context).actionsIndex.mealActions.addToFavorites(mealToAddAsFavorite);
    });
  }

  void removeFromFavorites(Meal mealToRemoveFromFavorites){
    setState(() {
      var favorites = AppState.of(context).dataIndex.favorites;
      favorites.removeWhere((favorite){
        return favorite.id == mealToRemoveFromFavorites.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    _categoryArg = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryArg.title),
        backgroundColor: _categoryArg.color,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealWidget(_categoryArg.meals[index]);
        },
        itemCount: _categoryArg.meals.length,
      ),
    );
  }

}
