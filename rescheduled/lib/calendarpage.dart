import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'createpage.dart';

class Calendarpage extends StatefulWidget {
  @override
  CalendarpageState createState() => CalendarpageState();
}

class CalendarpageState extends State<Calendarpage> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _events = {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: new Drawer(
        child: ListView(
          children: [
            new DrawerHeader(
              child: Text(
                'Schedule',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Text('item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('item 2'),
              onTap: () {},
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TableCalendar(
              events: _events,
              calendarController: _controller,
              initialCalendarFormat: CalendarFormat.week,
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(
                  fontSize: 20,
                ),
                formatButtonShowsNext: false,
              ),
              calendarStyle: CalendarStyle(
                  todayColor: Theme.of(context).primaryColor,
                  selectedColor: Colors.lightBlueAccent),
            ),
            Divider(),
            emptyField
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CreatePage()));
          }),
    );
  }

  Widget emptyField = Container(
    padding: EdgeInsets.all(10),
    child: Text(
      'No scheduled events today',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
