import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart' as ts;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutterappmedium/object/country.dart';
import 'package:flutterappmedium/widget/menu.dart';

class Donut extends StatefulWidget {
  @override
  _DonutState createState() => _DonutState();
}

class _DonutState extends State<Donut> {

  List<charts.Series> seriesList;
  bool animate = true;

  @override
  void initState() {
    seriesList = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Country c = Country().getUserCountry();

    return Scaffold(

      drawer: Menu(),
      appBar: AppBar(
          title: Text(
              "Pie Chart"
          )
      ),

      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/homebg.jpeg"),
              fit: BoxFit.cover,
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: FittedBox(
                          child: Text(c.countryName.toUpperCase(),
                            style: ts.TextStyle(fontSize: 60, letterSpacing: 1,
                                color: Colors.white, fontWeight: FontWeight.w500
                            ),
                          )
                      )
                  ),
                  SizedBox(height: 10.0,),
                  Expanded(
                    child: charts.PieChart(
                        seriesList,
                        animate: true,
                        animationDuration: Duration(seconds: 3),
                        defaultInteractions: true,
                        behaviors: [
                          charts.DatumLegend(
                            position: charts.BehaviorPosition.bottom,
                            desiredMaxColumns: 1,
                            legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
                            entryTextStyle: charts.TextStyleSpec(
                                color: charts.MaterialPalette.white,
                                fontSize: 18),

                          )
                        ],
                        defaultRenderer: new charts.ArcRendererConfig(
                          arcWidth: 1000,
                          /*arcRendererDecorators: [
                              new charts.ArcLabelDecorator(
                                  labelPosition: charts.ArcLabelPosition.outside)
                            ]*/)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );  }

  static List<charts.Series<LinearStats, String>> fetchData() {

    Country c = Country().getUserCountry();

    final data = [
      new LinearStats("Confirmed - " + c.totalConfirmed.toString(), c.totalConfirmed, Color.fromHex(code: '#ff8000')),
      new LinearStats("Recovered - " + c.totalRecovered.toString(), c.totalRecovered, Color.fromHex(code: '#2eb82e')),
      new LinearStats("Deaths - " + c.totalDeaths.toString(), c.totalDeaths, Color.fromHex(code: '#ff471a')),
    ];

    return [
      new charts.Series<LinearStats, String>(
        id: 'Stats',
        domainFn: (LinearStats stats, _) => stats.title,
        measureFn: (LinearStats stats, _) => stats.stats,
        data: data,
        colorFn: (LinearStats stats, _) => stats.color,
      )
    ];
  }

}

class LinearStats {
  String title;
  int stats;
  Color color;

  LinearStats(this.title, this.stats, this.color);
}