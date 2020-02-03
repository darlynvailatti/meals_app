import 'package:flutter/material.dart';
import 'package:meals_app/pages/categories_page.dart';
import 'package:meals_app/pages/category_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
      ),
      home: CategoriesPage(),
      routes: {
        CategoryPage.routName: (ctx) => CategoryPage(),
      },
    );
  }
}
