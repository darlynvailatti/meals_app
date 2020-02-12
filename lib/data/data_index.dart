
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

class DataIndex {

  final List<Meal> meals;
  final List<Category> categories;
  final List<Meal> favorites;

  DataIndex.defaultData({this.meals, this.categories, this.favorites});


}