import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/pages/categories_page.dart';
import 'package:meals_app/pages/options_page.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildTitle(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      padding: EdgeInsets.only(top: 25, left: 10, right: 10),
      alignment: Alignment.center,
      child: Text(
        'Cooking Up',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  ListTile _buildListTile(
      BuildContext context, String title, IconData icon, Function onTab) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: onTab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          _buildTitle(context),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
            thickness: 2,
          ),
          _buildListTile(context, 'Meals', Icons.fastfood, () {
            Navigator.of(context).pushReplacementNamed(Navigator.defaultRouteName);
          }),
          _buildListTile(context, 'Options', Icons.code, () {
            Navigator.of(context).pushNamed(OptionsPage.routeName);
          })
        ],
      ),
    );
  }
}
