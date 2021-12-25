
import 'package:flutter/material.dart';

import '../Widgets/meal_item.dart';
import '../models/meal.dart';
class CategoryMealsScreen extends StatefulWidget {
  // final String  categoryId;
  // final String Categorytitle;
  static const RouteName=':/Category-meals';
  final List<Meal> availiablemeals;

  CategoryMealsScreen(this.availiablemeals);
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

   String Categorytitle;
   List<Meal>displayedMeals;
   var loadedInitData=false;

  @override
  void initState(){
    
    super.initState();
  }
  @override
  void  didChangeDependencies(){
    if(!loadedInitData){
    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
    Categorytitle=routeArgs['title'];
    final  Categoryid=routeArgs['id'];
    displayedMeals= widget.availiablemeals.where((meal){
    return meal.categories.contains(Categoryid);
    }).toList();
    loadedInitData=true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealid){
      setState(() {
        displayedMeals.removeWhere((meal) => meal.id==mealid);
      });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(Categorytitle),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(
        id: displayedMeals[index].id,  
        title:displayedMeals[index].title,
        imageurl:displayedMeals[index].imageUrl,
        duration: displayedMeals[index].duration,
        affordability: displayedMeals[index].affordability,
        complexity: displayedMeals[index].complexity,
        remove: removeMeal,
        );

      },
      itemCount: displayedMeals.length,),
    );
  }
}