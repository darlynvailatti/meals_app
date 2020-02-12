import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/my_state_app.dart';
import 'package:toast/toast.dart';

class MealDetailsChoice {
  const MealDetailsChoice({this.title, this.icon, this.card});

  final String title;
  final IconData icon;
  final Widget card;
}

class MealDetailsPage extends StatelessWidget {
  static const routeName = "/mealDetails";

  buildCenteredTitle(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var meal = ModalRoute.of(context).settings.arguments as Meal;

    var mealDetailsChoiceCardIngredients = MealDetailsChoice(
        card: MealDetailsChoiceCardIngredients(
          ingredients: meal.ingredients,
        ),
        title: 'Ingredients',
        icon: Icons.fastfood);

    var mealDetailsChoiceCardSteps = MealDetailsChoice(
      card: MealDetailsChoiceCardSteps(
        steps: meal.steps,
      ),
      title: 'Steps',
      icon: Icons.list,
    );

    var choices = [
      mealDetailsChoiceCardIngredients,
      mealDetailsChoiceCardSteps
    ];


    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.network(meal.imageUrl),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 10, bottom: 10),
                        child: FloatingActionButton(
                          heroTag: 'favoriteBtn',
                          child: Icon(Icons.star),
                          onPressed: (){
                            AppState.of(context).actionsIndex.mealActions.addToFavorites(meal);
                            Toast.show("Succefully added to favorites!", context,
                              duration: Toast.LENGTH_LONG,
                              gravity:  Toast.TOP,
                            );
                          },
                        )
                      ),
                    ],
                  ),
                ],
              ),

            ),
            TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              labelColor: Theme.of(context).primaryColor,
              tabs: choices.map((MealDetailsChoice choice) {
                return Tab(
                  icon: Icon(choice.icon),
                  text: choice.title,
                );
              }).toList(),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: TabBarView(
                children: choices.map((MealDetailsChoice choice) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: choice.card,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'deleteMealBtn',
          child: Icon(Icons.delete),
          onPressed: () {
            AppState.of(context).actionsIndex.mealActions.deleteMeal(meal);
            Navigator.of(context).pop(meal);
            Toast.show("Succefully deleted!", context,
              duration: Toast.LENGTH_LONG,
              gravity:  Toast.TOP,
            );
          },
        ),
      ),
    );
  }
}

class MealDetailsChoiceCardIngredients extends StatelessWidget {
  MealDetailsChoiceCardIngredients({this.ingredients});

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: ListView(
          children: ingredients.map((String ingredient) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Text(ingredient),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class MealDetailsChoiceCardSteps extends StatelessWidget {
  MealDetailsChoiceCardSteps({this.steps});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Column(children: [
            ListTile(
              title: Text(
                steps[index],
                style: TextStyle(fontSize: 14),
              ),
              leading: CircleAvatar(
                child: Text(
                  '${(index + 1)}',
                ),
              ),
            ),
            Divider(),
          ]);
        },
        itemCount: steps.length,
      ),
    );
  }
}
