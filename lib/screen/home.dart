import 'package:flutter/material.dart';
import 'package:flutterappmedium/object/country.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map data = {};
  List<Country> cLst;
  Country c;
  String cN;

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    cLst = data["cLst"];
    cN = data["cN"];
    if(cN != null){
      c = cLst.where((i) => i.countryName == cN).elementAt(0);
    }else {
      c = cLst.where((i) => i.countryName == "Peru").elementAt(0);
    }

    return Scaffold(

        appBar: AppBar(
          title: Text(
              c.countryName + " Corona Statistics"
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
                      child: Text(c.countryName.toUpperCase(),
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
                  Text(c.totalConfirmed.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35,color: Colors.white))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("New Deaths: ",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25,color: Colors.white),),
                  Text(c.newDeaths.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35,color: Colors.white))
                ],
              ), Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Total Deaths: ",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25,color: Colors.white)),
                  Text(c.totalDeaths.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35,color: Colors.white))
                ],
              ), Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("New Recovered: ",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25,color: Colors.white)),
                  Text(c.newRecovered.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 35,color: Colors.white))
                ],
              ), Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Total Recovered: ", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25,color: Colors.white)),
                  Text(c.totalRecovered.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35,color: Colors.white))
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: FlatButton.icon(
                  icon: Icon(
                      Icons.flag
                  ),
                  onPressed: () {

                    Navigator.pushReplacementNamed(context, '/selectCountry', arguments: {
                      'cLst': cLst
                    });

                  },
                  color: Colors.white60,
                  label: Text("Change Country"),
                ),
              ),

            ],
          ),
        )
    );
  }

}