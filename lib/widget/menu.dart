import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/homebg.jpeg'))),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {Navigator.pushReplacementNamed(context, '/home')},
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text('Global'),
            onTap: () => {Navigator.pushReplacementNamed(context, '/global')},
          ),
          ListTile(
            leading: Icon(Icons.pie_chart),
            title: Text('Pie Chart'),
            onTap: () => {Navigator.pushReplacementNamed(context, '/donut')},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('About'),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}