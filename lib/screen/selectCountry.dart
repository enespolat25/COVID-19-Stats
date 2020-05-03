import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutterappmedium/object/country.dart';
import 'package:flutterappmedium/object/global.dart';
import 'package:flutterappmedium/widget/menu.dart';

class SelectCountry extends StatefulWidget {

  @override
  _SelectCountryState createState() => _SelectCountryState();

}

class _SelectCountryState extends State<SelectCountry> {

  List<Country> cLst;
  Global gb;

  AutoCompleteTextField autoCompleteTextField;
  GlobalKey<AutoCompleteTextFieldState<Country>> key= new GlobalKey();

  Widget row(Country c){
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      color: Colors.white.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            c.countryName,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    cLst = Country().cLst;

    return Scaffold(
      drawer: Menu(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Change Country"),
      ),

      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/homebg.jpeg"),
              fit: BoxFit.fitHeight,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            autoCompleteTextField =
                AutoCompleteTextField<Country>(
                  key: key,
                  clearOnSubmit: false,
                  suggestions: cLst,
                  style: TextStyle(
                      color: Colors.white, fontSize: 16
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 30, 10, 20),
                      hintText: "Search Country Name",
                      hintStyle: TextStyle(color: Colors.white)
                  ),
                  itemFilter: (item, query){
                    return item.countryName.toLowerCase().startsWith(query.toLowerCase());
                  },
                  itemSorter: (a, b){
                    return a.countryName.compareTo(b.countryName);
                  },
                  itemSubmitted: (item){
                    setState(() {
                      autoCompleteTextField.textField.controller.text = item.countryName;
                    });
                  },
                  itemBuilder: (context, item){
                    return row(item);
                  },
                ),
            Center(
              child: FlatButton.icon(
                icon: Icon(
                    Icons.flag
                ),
                onPressed: () {
                  String ip = autoCompleteTextField.textField.controller.text;
                  if(ip == null || ip.length == 0) {
                    showDialog(
                        context: context,
                        builder: (_) =>
                        new AlertDialog(
                          title: new Text("Error!"),
                          content: Text("Please input country name"),
                        )
                    );
                  }else {
                    if(cLst.where((i) => i.countryName == ip).length > 0){

                      Country().setUserCountry(cLst.where((i) => i.countryName == ip).elementAt(0));


                      Navigator.pushReplacementNamed(context, '/home');

                      /*      Navigator.pushReplacementNamed(context, '/home', arguments: {
                      'cN': autoCompleteTextField.textField.controller.text
                    });*/


                    }
                    else{
                      showDialog(
                          context: context,
                          builder: (_) =>
                          new AlertDialog(
                            title: new Text("Not Found"),
                            content: new Text("Country input is not a valid name"),
                          )
                      );
                    }
                  }

                },
                color: Colors.white60,
                label: Text("Change Country"),
              ),
            ),
          ],
        ),
      ),

    );
  }
}