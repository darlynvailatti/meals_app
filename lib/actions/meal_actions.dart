
import 'package:flutter/cupertino.dart';
import 'package:meals_app/models/meal.dart';

import '../my_state_app.dart';

class MealActions {

  Function deleteMeal;

  Function addToFavorites;

  Function removeFromFavorites;

  MealActions(){
    addToFavorites = _addMealToFavorites;
    removeFromFavorites = _removeFromFavorites;
  }

  void _addMealToFavorites(Meal mealToAddAsFavorite, BuildContext context){
    var favorites = AppState.of(context).dataIndex.favorites;
    favorites.add(mealToAddAsFavorite);
  }

  void _removeFromFavorites(Meal mealToRemove, BuildContext context){
    List<Meal> favorites = AppState.of(context).dataIndex.favorites;
    favorites.removeWhere((favorite) {
      return favorite.id == mealToRemove.id;
    });
  }

}