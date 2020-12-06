import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum NoteMode { Editing, Adding }

class Note extends StatelessWidget {
  final NoteMode _noteMode;
  Note(this._noteMode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_noteMode == NoteMode.Adding ? 'Add note' : 'Edit note'
            //pwede ra sad ni gamiton ^
            /*if(_noteMode == NoteMode.Adding)
              return 'Add note'
            else
              return 'Edit note' */
            ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Note title'),
            ),
            Container(height: 8),
            TextField(
              decoration: InputDecoration(hintText: 'Note text'),
            ),
            Container(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Discard',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.grey,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*class _NoteButton extends StatelessWidget {

    final String _text;
    final String _color;
    final String _onPressed;

  _NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: _onPressed,
          child: Text(
              _text,
              style: TextStyle(color: Colors.white),
        ),
       color: _color,
      );
  }
}*/
