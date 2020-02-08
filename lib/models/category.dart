
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class Category {

  final String id;
  final String title;
  final Color color;
  List<Meal> meals;

  Category({
    @required this.title,
    @required this.id,
    this.color = Colors.orange,
  });



  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

}