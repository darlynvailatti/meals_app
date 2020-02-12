
import 'package:meals_app/pages/categories_page.dart';
import 'package:meals_app/pages/category_page.dart';
import 'package:meals_app/pages/favorite_meals_page.dart';
import 'package:meals_app/pages/meal_details_page.dart';
import 'package:meals_app/pages/options_page.dart';

class PagesIndex {

  final CategoriesPage categoriesPage;
  final CategoryPage categoryPage;
  final FavoritesMealsPage favoritesCategoriesPage;
  final MealDetailsPage mealDetailsPage;
  final OptionsPage optionsPage;

  PagesIndex({
    this.categoriesPage,
    this.categoryPage,
    this.favoritesCategoriesPage,
    this.mealDetailsPage,
    this.optionsPage
  });

  PagesIndex.defaultPages(
  {this.categoriesPage, this.categoryPage,
      this.favoritesCategoriesPage, this.mealDetailsPage, this.optionsPage});


}