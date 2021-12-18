import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../Widgets/category_item.dart';
class CategoryScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DeliMeals'),),
      body: GridView(
        padding: const EdgeInsets.all(25),

      children: DUMMY_CATEGORIES.map((catData)=>CategoryItem(catData.id,catData.title,catData.color)).toList(), 
      gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        ),
    
    
      ),
    );

  }
}