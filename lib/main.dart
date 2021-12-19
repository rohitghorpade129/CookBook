
import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/meal_deatails_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/':(ctx)=>CategoryScreen(),
       CategoryMealsScreen.RouteName:(ctx)=> CategoryMealsScreen(),
       MealDetailscreen.routeName:(ctx)=> MealDetailscreen()
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
