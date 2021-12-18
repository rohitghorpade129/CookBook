import 'package:flutter/material.dart';

class MealDetailscreen extends StatelessWidget {
  static const routeName='/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(mealid),),
      body: Text('meals- ${mealid}!',style: Theme.of(context).textTheme.subtitle1,),
    );
  }
}