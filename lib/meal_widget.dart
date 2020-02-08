

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/affordability.dart';
import 'package:meals_app/models/meal.dart';

class MealWidget extends StatelessWidget {

  final Meal _meal;

  MealWidget(this._meal);

  void selectMeal() {

  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: selectMeal,
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
                  _meal.imageUrl,
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
                    _meal.title,
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
                    Text("${_meal.duration} min"),
                  ]),
                  Row(
                    children: <Widget>[
                      Icon(Icons.shop),
                      SizedBox(width: 10,),
                      Text(
                          AffordabilityValues[_meal.affordability]
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}