

import 'package:flutter/cupertino.dart';
import 'package:meals_app/actions/actions_index.dart';
import 'package:meals_app/data/data_index.dart';
import 'package:meals_app/pages/page_index.dart';

class AppState extends InheritedWidget {

  final Widget child;
  final Key key;

  final DataIndex dataIndex;
  final PagesIndex pagesIndex;
  final ActionsIndex actionsIndex;

  AppState({
    @required this.child,
    @required this.actionsIndex,
    @required this.pagesIndex,
    @required this.dataIndex,
    this.key, })
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return true;
  }
  static AppState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppState>();

}