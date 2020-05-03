import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterappmedium/object/country.dart';
import 'package:flutterappmedium/object/global.dart';
import 'package:flutterappmedium/service/covid-service.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  List<Country> cLst;

  void fetchData() async {
    var data = await getData();
    parseData(data);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'cLst': cLst
    });
  }

  parseData(dynamic json){
    Global.singleton().fromJson(json['Global']);
    var list = json['Countries'] as List;
    cLst = list.map((i) => Country.fromJson(i)).toList();
    Country.singleton().setList(cLst);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[399],
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/loadbg.png"),
              fit: BoxFit.fitHeight,
            )
        ),
        child: Center(
          child: SpinKitHourGlass(
            color: Colors.white70,
            size: 180,
          ),
        ),
      ),
    );
  }
}