

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/my_state_app.dart';
import 'package:meals_app/pages/categories_page.dart';
import 'package:meals_app/pages/favorite_meals_page.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabStateWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TabState();
  }

}

class _MainPage {

  final String title;
  final Widget pageWidget;

  _MainPage({this.title, this.pageWidget});

}

class _TabState extends State<TabStateWidget> {

   List<_MainPage> _pages = [
     _MainPage(
       title: 'Categories',
       pageWidget: CategoriesPage(),
     ),
     _MainPage(
       title: 'Favorites',
       pageWidget: FavoritesMealsPage(),
     ),
  ];

   var _selectedPageIndex = 0;

   void _selectPage(int index){
     setState(() {
        _selectedPageIndex = index;
     });
   }


  @override
  Widget build(BuildContext context) {

    var currentPage = _pages[_selectedPageIndex];

    return  Scaffold(
        appBar: AppBar(
          title: Text('${currentPage.title}'),
        ),
        body: currentPage.pageWidget,
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text("Categories"),
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            title: Text("Favorites"),
            icon: Icon(Icons.star),
          ),
        ],

      ),
    );

  }

}
