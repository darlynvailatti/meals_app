import 'package:flutter/material.dart';
import 'package:meals_app/actions/actions_index.dart';
import 'package:meals_app/actions/meal_actions.dart';
import 'package:meals_app/data/data_index.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/my_state_app.dart';
import 'package:meals_app/pages/categories_page.dart';
import 'package:meals_app/pages/category_page.dart';
import 'package:meals_app/pages/favorite_meals_page.dart';
import 'package:meals_app/pages/options_page.dart';
import 'package:meals_app/pages/meal_details_page.dart';
import 'package:meals_app/pages/page_index.dart';
import 'package:meals_app/widgets/tab_state_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp>{


  List<Category> _categories;
  List<Meal> _meals;
  AppState _appState;

  void addMealToFavorites(Meal mealToAddAsFavorite, BuildContext context){
    var favorites = AppState.of(context).dataIndex.favorites;
    favorites.add(mealToAddAsFavorite);
  }

  @override
  void initState() {
    print('Inicializing...');
    _categories = DummyData.categories;
    _meals = DummyData.getMeals(_categories);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var materialApp = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
      ),
      initialRoute: Navigator.defaultRouteName,
      routes: {
        Navigator.defaultRouteName: (ctx) => TabStateWidget(),
        CategoryPage.routName: (ctx) => _appState.pagesIndex.categoryPage,
        MealDetailsPage.routeName: (ctx) => _appState.pagesIndex.mealDetailsPage,
        OptionsPage.routeName: (ctx) => _appState.pagesIndex.optionsPage,
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesPage());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesPage());
      },
    );


    var pagesIndex = PagesIndex.defaultPages(
      categoriesPage: CategoriesPage(),
      categoryPage: CategoryPage(),
      favoritesCategoriesPage: FavoritesMealsPage(),
      mealDetailsPage: MealDetailsPage(),
      optionsPage: OptionsPage(),
    );

    var actionsIndex = ActionsIndex.defaultActions(
      mealActions: MealActions(),
    );

    var dataIndex = DataIndex.defaultData(
      categories: _categories,
      meals: _meals,
      favorites: [],
    );

    _appState = AppState(
      child: materialApp,
      dataIndex: dataIndex,
      pagesIndex: pagesIndex,
      actionsIndex: actionsIndex,
    );
    return _appState;
  }

}


