import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'note.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Note(NoteMode.Editing)));
          },
          child: Card(
              child: Padding(
            padding: const EdgeInsets.only(
                top: 30.0, bottom: 30, left: 13.0, right: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _NotesTitle(),
                Container(height: 4),
                _NotesText()
              ],
            ),
          )),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Note(NoteMode.Adding)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _NotesTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Title',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class _NotesText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'text',
      style: TextStyle(color: Colors.grey.shade600),
    );
  }
}
