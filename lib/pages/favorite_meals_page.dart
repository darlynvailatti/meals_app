


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/my_state_app.dart';
import 'package:meals_app/widgets/favorite_meal_start_widget.dart';

class FavoritesMealsPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var favorites = AppState.of(context).dataIndex.favorites;

    return ListView.builder(
        itemBuilder: (ctx, index){
          return ListTile(
            title: Text(favorites[index].title),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                favorites[index].imageUrl
              ),
            ),
            trailing: FavoriteMealStarWidget(favorites[index]),
          );
      },
      itemCount: favorites.length,);
  }

}