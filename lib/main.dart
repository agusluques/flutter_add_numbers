import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
      theme: new ThemeData(primarySwatch: Colors.lightBlue),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  double _suma = 0.0;
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Add 2 numbers"),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Center(
              child: Container(
                padding: const EdgeInsets.all(40.0),
                child: Column(

                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: TextField(
                                    decoration: new InputDecoration(
                                                      labelText: "First Number",
                                                      fillColor: Colors.white,
                                                      border: new OutlineInputBorder(
                                                        borderRadius: new BorderRadius.circular(25.0),
                                                        borderSide: new BorderSide(
                                                        ),
                                                      ),
                                                      //fillColor: Colors.green
                                                    ),
                                    keyboardType: TextInputType.number,
                                    controller: myController1,
                                )
                        ),
                        const Icon(Icons.add, size: 30.0),
                        Flexible(
                            child: TextField(
                              decoration: new InputDecoration(
                                labelText: "Second Number",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                                //fillColor: Colors.green
                              ),
                              keyboardType: TextInputType.number,
                              controller: myController2,
                            )
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 40.0),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Ink(
                          decoration: ShapeDecoration(
                          color: Colors.lightBlue,
                          shape: CircleBorder(),
                        ),
                        child:  Container(
                            height: 90.0 ,
                            width: 90.0 ,
                            child: FloatingActionButton(
                                    child: Text( "=", style: new TextStyle(
                                            fontSize: 80.0
                                      )),
                                    onPressed: () {
                                      setState(() {
                                        _suma = double.parse(myController1.text) + double.parse(myController2.text);
                                      });
                                    },
                                  )
                          )
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 40.0),),
                    Container(
                      child: AutoSizeText(
                          "$_suma",
                          style: TextStyle(fontSize: 80.0),
                          maxLines: 1,
                        )
                    )
                  ])
              )));
  }
}