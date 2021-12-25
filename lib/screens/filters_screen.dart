

import '../Widgets/Main_Drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  
  static const routeName='/filters';
  final Function savefilters;
  final Map<String,bool> currentfilters;
  FilterScreen (this.savefilters,this.currentfilters);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var Gluternfree=false;
  var lactosefree=false;
  var vegan=false;
  var vegetarian=false;
  
  @override
  initState(){
  Gluternfree=widget.currentfilters['gluten'];
  lactosefree=widget.currentfilters['Lactose'];
  vegetarian=widget.currentfilters['vegetarian'];
  vegan=widget.currentfilters['vegan'];
  super.initState();
  }
  
  Widget buildSwitchList(String title,bool cvalue,String  Description ,Function update){
    return SwitchListTile(title: Text(title), value: cvalue, subtitle: Text(Description) ,
              onChanged:update
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.save),onPressed:(){
          final selectedfilters={
            'gluten':Gluternfree,
            'Lactose':lactosefree,
            'vegetarian':vegetarian,
            'vegan':vegan,
          };
          widget.savefilters(selectedfilters);
          }, 
          ),
      ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children:<Widget>[
          Container(padding: EdgeInsets.all(20),
          child: Text("adjust meal selection ",style: Theme.of(context).textTheme.subtitle1,),),
          Expanded(child: ListView(
            children: <Widget>[
              buildSwitchList('Gluten free', Gluternfree, 'only include gluten free foods', (newVal){
                setState(() {
                  Gluternfree=newVal;
                });
              }),
              buildSwitchList('lactose free', lactosefree, 'only include lactose free foods', (newVal){
                setState(() {
                  lactosefree=newVal;
                });
              }),
              buildSwitchList('Vegan', vegan, 'only include vegan foods', (newVal){
                setState(() {
                  vegan=newVal;
                });
              }),
              buildSwitchList('veg only', vegetarian, 'only include Vegetarian foods', (newVal){
                setState(() {
                  vegetarian=newVal;
                });
              }),
              
            ],
          ))
        ],
        ),

    );
  }
}