import 'package:flutter/material.dart';
import 'package:flutterappmedium/screen/donutchart.dart';
import 'package:flutterappmedium/screen/global.dart';
import 'package:flutterappmedium/screen/home.dart';
import 'package:flutterappmedium/screen/loading.dart';
import 'package:flutterappmedium/screen/selectCountry.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => Loading(),
        '/selectCountry': (context) => SelectCountry(),
        '/home': (context) => HomePage(),
        '/global': (context) => GlobalPage(),
        '/donut': (context) => Donut()
      },
    );
  }
}