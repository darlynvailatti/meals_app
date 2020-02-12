

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/affordability.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/my_state_app.dart';
import 'package:meals_app/pages/meal_details_page.dart';
import 'package:meals_app/widgets/favorite_meal_start_widget.dart';
import 'package:toast/toast.dart';

class MealWidget extends StatefulWidget {

  final Meal _meal;

  MealWidget(this._meal);

  @override
  _MealWidgetState createState() => _MealWidgetState();
}

class _MealWidgetState extends State<MealWidget> {

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsPage.routeName, arguments: widget._meal);
  }

  void _addToFavorites(Meal meal, BuildContext context){
    setState(() {
      AppState.of(context).actionsIndex.mealActions.addToFavorites(meal, context);
    });
  }

  void _removeFromFavorites(Meal meal, BuildContext context){
    setState(() {
      AppState.of(context).actionsIndex.mealActions.removeFromFavorites(meal, context);
    });
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () => { selectMeal(context) },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                ),
                child: Image.network(
                  widget._meal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    widget._meal.title,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ]
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(width: 10,),
                    Text("${widget._meal.duration} min"),
                  ]),
                  Row(
                    children: <Widget>[
                      Icon(Icons.shop),
                      SizedBox(width: 10,),
                      Text(
                          AffordabilityValues[widget._meal.affordability]
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      FavoriteMealStarWidget(
                        meal: widget._meal,
                        addToFavorites: _addToFavorites,
                        removeFromFavorites: _removeFromFavorites,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}