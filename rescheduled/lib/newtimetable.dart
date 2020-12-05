import 'package:flutter/material.dart';
import 'calendarpage.dart';

class Timetable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('New Timetable'),
          actions: <Widget>[
            FlatButton(
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Calendarpage()));
                },
                child: Text("Done"),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent))),
          ],
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  Widget getBox(String name, int idx) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          padding: EdgeInsets.only(left: 10, top: 40, bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                      child: Text(
                    'Title |',
                    style: TextStyle(fontSize: 20.0),
                  )),
                  Expanded(
                      child: Text(
                    'Title',
                    style: TextStyle(fontSize: 15.0),
                  )),
                ],
              ),
              Divider(color: Colors.black, thickness: 1),
              Divider(color: Colors.black, thickness: 1),
              Text(
                '           Start Week on                                    End Week on',
              ),
              Text(
                '               Monday                                               Friday',
              ),
              Divider(color: Colors.black, thickness: 1),
              Text(
                '         Time View                            Period View',
                style: TextStyle(fontSize: 18.0),
              ),
              Divider(color: Colors.black, thickness: 1),
              Divider(color: Colors.black, thickness: 1),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Dividing Line',
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(color: Colors.black, thickness: 1),
              Row(
                children: <Widget>[
                  Text("  Day,time,text color"),
                  SizedBox(width: 100),
                  RaisedButton(onPressed: null),
                ],
              ),
              Divider(color: Colors.black, thickness: 1),
            ],
          )),
    );
  }
}
