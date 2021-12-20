import 'package:CookBook/screens/Favoritea_screen.dart';
import 'package:CookBook/screens/categories_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          title: Text('Meals'),
          bottom: TabBar(tabs: <Widget>[
          Tab(icon: Icon(Icons.category), text: 'Categories',),
          Tab(icon: Icon(Icons.star), text: 'Favorites',),
      ],
      ),
      ),
      body: TabBarView(children: <Widget>[
          CategoryScreen(),
          FavoritesScreen(),
      ],
      ),
      )
      );
  }
}