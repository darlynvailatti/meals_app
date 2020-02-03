
import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryPage extends StatelessWidget{

  static const routName = '/category';

  @override
  Widget build(BuildContext context) {
    final categoryArg = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryArg.title),
        backgroundColor: categoryArg.color,
      ),
      body: Center(
        child: Text(categoryArg.color.toString()),
      ),
    );
  }

}