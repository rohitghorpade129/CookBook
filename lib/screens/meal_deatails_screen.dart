import 'package:flutter/material.dart';
import '/dummy_data.dart';
class MealDetailscreen extends StatelessWidget {
  static const routeName='/meal-detail';
  final Function toggleFav;
  final Function isfav;
  const MealDetailscreen(this.toggleFav,this.isfav) ;

    
  Widget buildSectionTitle (BuildContext context ,String ext){
    return Container(
            child: Text(
              ext,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          );
  }

  Widget BuildContainer(Widget child){
    return Container(
            decoration: BoxDecoration(color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 200,
            width: 300,
            child: child,) ;
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final selectMeal=DUMMY_MEALS.firstWhere((meal )=> mealid == meal.id);
    return Scaffold(
      appBar: AppBar(title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:<Widget> [
            Container(
              
              width: double.infinity,
              child: Image.network(
              selectMeal.imageUrl,
              fit: BoxFit.cover,
              ),
            ),
            
            buildSectionTitle(context, 'Ingredients'),
            BuildContainer(
               ListView.builder(
                itemBuilder:(ctx,index)=>Card(
                  color: Theme.of(context).accentColor,
                  child:Padding(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    child: Text(selectMeal.ingredients[index],style: TextStyle(color: Colors.black),)),
                ) ,
                itemCount: selectMeal.ingredients.length,
                )
            
                ),
            buildSectionTitle(context, 'Steps'),
            BuildContainer(
               ListView.builder(
                itemBuilder:(ctx,index)=>Column(
                  children:[ ListTile(
                    leading: CircleAvatar(child: Text('# ${index + 1}'),),
                    title: Text(selectMeal.steps[index]),
                  ),
                  Divider(thickness: 3,),
                  ]
                ),
                itemCount: selectMeal.steps.length,
                )
            
                ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(
        isfav(mealid) ? Icons.star : Icons.star_border_sharp),
        onPressed:()=> toggleFav(mealid),
      ),
    );
  }
}