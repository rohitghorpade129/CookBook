import '../screens/filters_screen.dart';
import 'package:flutter/material.dart';


class MainDrawer extends StatelessWidget {
  Widget BuildListtile(BuildContext context, String title ,IconData icon ,Function taphandler){
    return ListTile(leading: Icon(icon,size: 26,),
        title: Text(title ,
        style: TextStyle(fontFamily: 'RobotoCondensed', fontWeight: FontWeight.w700,fontSize: 24,color: Theme.of(context).primaryColor),
        ),
        onTap: (){
          taphandler();
        },
        );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text("Cooking Up",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30,color: Theme.of(context).primaryColor)),
        ),
        SizedBox(height: 20),
        BuildListtile(context,'Meals',Icons.restaurant,(){
           Navigator.of(context).pushReplacementNamed('/');
        }),
        BuildListtile(context,'filters',Icons.settings,(){
         Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
        }
        ),
      ],
      ),
    );
  }
}