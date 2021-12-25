
import './models/meal.dart';
import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import './dummy_data.dart';
import '../screens/category_meals_screen.dart';
import '../screens/meal_deatails_screen.dart';
import '../screens/Tabs_screen.dart';
import '../screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 Map<String,bool>filters={
   'gluten':false,
   'Lactose':false,
   'vegetarian':false,
   'vegan':false,
 };
 List<Meal>availiableMeals=DUMMY_MEALS;
 List<Meal>Favorites=[];

 void setfilters(Map<String,bool>filterData){
   setState(() {
     filters=filterData;
     
     availiableMeals=DUMMY_MEALS.where((meal) {
       if(filters['gluten'] && !meal.isGlutenFree){
         return false;
       }
       if(filters['Lactose'] && !meal.isLactoseFree){
         return false;
       }
       if(filters['vegetarian'] && !meal.isVegetarian){
         return false;
       }
       if(filters['vegan'] && !meal.isVegan){
         return false;
       }
       return true;
     }).toList();
   });
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255,254,229,4),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromARGB(20, 51, 51, 1)
          ),
          bodyText2: TextStyle(
            color: Color.fromARGB(20, 51, 51, 1)
          ),
          subtitle1: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )
        ),
      ),
      //home: CategoryScreen(),
      initialRoute: '/',
      routes: {
      '/':(ctx)=>TabsScreen(Favorites),
       CategoryMealsScreen.RouteName:(ctx)=> CategoryMealsScreen(availiableMeals),
       MealDetailscreen.routeName:(ctx)=> MealDetailscreen(),
       FilterScreen.routeName:(ctx)=>FilterScreen(setfilters,filters),
       
      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   //return MaterialPageRoute(builder: (ctx) => CategoryScreen(),);
      // },
      // onUnknownRoute:(settings){
      //   print("Page Not Found!!!");
      //   return MaterialPageRoute(builder: (ctx) => CategoryScreen(),);
      // } ,
    );
  } 
}

class MyHomePage extends StatefulWidget {
    @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
