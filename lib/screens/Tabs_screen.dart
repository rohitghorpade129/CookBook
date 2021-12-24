import './Favoritea_screen.dart';
import './categories_screen.dart';
import 'package:flutter/material.dart';
import '../Widgets/Main_Drawer.dart';
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String,Object>>pages=
  [{'page':CategoryScreen(),'title':'Categories'},
  {'page':FavoritesScreen(),'title':'Favorites'}];
  int selectedPageIndex=0;
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