import 'package:meals_app/category_item_widget.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/my_state_app.dart';

class CategoriesPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var _categories = AppState.of(context).categories;

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GridView(
        padding: EdgeInsets.all(15),
        children: _categories
            .map(
              (c) => CategoryItemWidget(c),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
