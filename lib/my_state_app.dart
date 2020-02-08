

import 'package:flutter/cupertino.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

class AppState extends InheritedWidget {

  final Widget child;
  final List<Category> categories;
  final List<Meal> meals;
  final Key key;

  AppState({@required this.categories,
    @required this.meals,
    @required this.child,
    this.key})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return true;
  }
  static AppState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppState>();
}