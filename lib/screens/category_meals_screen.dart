import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../Widgets/meal_item.dart';
class CategoryMealsScreen extends StatelessWidget {
  // final String  categoryId;
  // final String Categorytitle;
  static const RouteName=':/Category-meals';
  // CategoryMealsScreen(this.categoryId,this.Categorytitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final  Categorytitle=routeArgs['title'];
    final  Categoryid=routeArgs['id'];
    final CategoryMeals= DUMMY_MEALS.where((meal){
      return meal.categories.contains(Categoryid);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(Categorytitle),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(
        id: CategoryMeals[index].id,  
        title:CategoryMeals[index].title,
        imageurl:CategoryMeals[index].imageUrl,
        duration: CategoryMeals[index].duration,
        affordability: CategoryMeals[index].affordability,
        complexity: CategoryMeals[index].complexity,);
      },
      itemCount: CategoryMeals.length,),
    );
  }
}