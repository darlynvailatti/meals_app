import 'package:meals_app/widgets/category_item_widget.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/my_state_app.dart';

class CategoriesPage extends StatelessWidget {

  static final String routeName = "/categories";


  @override
  Widget build(BuildContext context) {

    var _categories = AppState.of(context).dataIndex.categories;

    return GridView(
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
    );
  }
}
