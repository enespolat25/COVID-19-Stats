import 'package:flutter/material.dart';
import 'package:flutterappmedium/object/global.dart';
import 'package:flutterappmedium/widget/menu.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPage createState() => _GlobalPage();
}

class _GlobalPage extends State<GlobalPage> {

  Global gb;

  @override
  Widget build(BuildContext context) {

    gb = Global();

    return Scaffold(

        drawer: Menu(),
        appBar: AppBar(
          title: Text(
              "Global" + " Corona Statistics"
          ),
        ),

        body:  Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/homebg.jpeg"),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 25),
                  child: FittedBox(
                      child: Text("global".toUpperCase(),
                        style: TextStyle(fontSize: 60, letterSpacing: 1,
                            color: Colors.white, fontWeight: FontWeight.w500
                        ),
                      )
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Total Confirmed: ",
                    style: TextStyle(fontSize: 25,color: Colors.white,
                        fontWeight: FontWeight.w700),),
                  Text(gb.totalConfirmed.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35,color: Colors.white))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("New Deaths: ",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25,color: Colors.white),),
                  Text(gb.newDeaths.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35,color: Colors.white))
                ],
              ), Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Total Deaths: ",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25,color: Colors.white)),
                  Text(gb.totalDeaths.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35,color: Colors.white))
                ],
              ), Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("New Recovered: ",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25,color: Colors.white)),
                  Text(gb.newRecovered.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 35,color: Colors.white))
                ],
              ), Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Total Recovered: ", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25,color: Colors.white)),
                  Text(gb.totalRecovered.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35,color: Colors.white))
                ],
              ),
            ],
          ),
        )
    );
  }

}