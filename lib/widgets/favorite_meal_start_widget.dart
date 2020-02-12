
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/my_state_app.dart';
import 'package:toast/toast.dart';

class FavoriteMealStarWidget extends StatelessWidget{

  final Function addToFavorites;
  final Function removeFromFavorites;
  final Meal meal;

  FavoriteMealStarWidget({
    @required this.meal,
    @required this.addToFavorites,
    @required this.removeFromFavorites,
  });


  @override
  Widget build(BuildContext context) {
    var favorites = AppState.of(context).dataIndex.favorites;

    Function action = (){
      addToFavorites(meal, context);
    };

    Icon favoriteIcon = Icon(Icons.star_border);
    String toastMessage = 'Succefully added to favorites!';

    if(favorites != null && favorites.length > 0) {
      var firstWhere = favorites.firstWhere((favorite) {
        return favorite.id == meal.id;
      }, orElse:(){ return null; });

      if(firstWhere != null){
        action = () {
          removeFromFavorites(meal, context);
        };
        favoriteIcon = Icon(Icons.star);
        toastMessage = 'Succefully removed from favorites!';
      }

    }

    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: favoriteIcon,
        iconSize: 30,
        color: Theme.of(context).accentColor,
        onPressed: (){
          action();
          Toast.show(toastMessage, context);
        },
      ),
    );
  }

}