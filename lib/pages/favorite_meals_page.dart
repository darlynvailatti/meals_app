import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/my_state_app.dart';
import 'package:meals_app/widgets/favorite_meal_start_widget.dart';

class FavoritesMealsPage extends StatefulWidget {
  @override
  _FavoritesMealsPageState createState() => _FavoritesMealsPageState();
}

class _FavoritesMealsPageState extends State<FavoritesMealsPage> {

  void _addToFavorites(Meal meal, BuildContext context) {
    setState(() {
      AppState.of(context).actionsIndex.mealActions.addToFavorites(meal, context);
    });
  }

  void _removeFromFavorites(Meal meal, BuildContext context) {
    setState(() {
      AppState.of(context).actionsIndex.mealActions.removeFromFavorites(meal, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var favorites = AppState.of(context).dataIndex.favorites;

    return ListView.builder(
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text(favorites[index].title),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(favorites[index].imageUrl),
          ),
          trailing: FavoriteMealStarWidget(
            meal: favorites[index],
            addToFavorites: _addToFavorites,
            removeFromFavorites: _removeFromFavorites,
          ),
        );
      },
      itemCount: favorites.length,
    );
  }
}
