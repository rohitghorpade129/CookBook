import 'package:flutter/material.dart';
import '../models/meal.dart';
class FavoritesScreen extends StatelessWidget {

  final List<Meal> favorites;

  FavoritesScreen(this.favorites) ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("You have no favorites",style: TextStyle(color: Colors.black),),
    );
  }
}