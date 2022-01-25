import 'package:flutter/material.dart';
import 'package:meals/pages/filtersPage.dart';

class SideDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon,Function eventHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        eventHandler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            (){
              Navigator.of(context).pushReplacementNamed('/');
              //pushReplacementNamed it's used to replace current page in stack with this new rout
            }
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            (){
              Navigator.of(context).pushReplacementNamed(Filters.routeName);
            }
          ),
        ],
      ),
    );
  }
}
