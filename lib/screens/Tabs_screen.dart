import './Favoritea_screen.dart';
import '../models/meal.dart';
import './categories_screen.dart';
import 'package:flutter/material.dart';
import '../Widgets/Main_Drawer.dart';
class TabsScreen extends StatefulWidget {
  final List<Meal>favorites;

   TabsScreen( this.favorites) ;

  
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>>pages;
  int selectedPageIndex=0;

 @override
  void initState() {
    
    pages=[{'page':CategoryScreen(),'title':'Categories'},
          {'page':FavoritesScreen(widget.favorites),'title':'Favorites'}];
    super.initState();
  }

  void Selectpage(int index){
    setState(() {
      selectedPageIndex=index;
    });     
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(pages[selectedPageIndex]['title']),
        ),
        drawer: MainDrawer(),
        
        body: pages[selectedPageIndex]['page'], 
        bottomNavigationBar: BottomNavigationBar(
        onTap: Selectpage ,  
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor, icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor,icon: Icon(Icons.star), title: Text('favorites')),
        ],
        ),
      );
      
  }
}