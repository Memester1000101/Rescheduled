import 'package:flutter/material.dart';
import 'home_screen.dart';

class CreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Schedule'),
      ),
      body: Center(
        child: Column(
          children: [
            CreateForm(),
          ],
        ),
      ),
    );
  }
}

class CreateForm extends StatefulWidget {
  @override
  _CreateFormState createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [_titleField(), _descriptionField(), _createBtn()],
        ),
      ),
    );
  }

  Widget _titleField() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Title',
        ),
        style: TextStyle(fontSize: 30),
      );

  Widget _descriptionField() => TextField(
        decoration: InputDecoration(
          labelText: 'Description',
        ),
        maxLines: 3,
      );

  Widget _createBtn() => Container(
      padding: EdgeInsets.only(top: 30),
      child: RaisedButton(
          child: Text('Create'),
          color: Colors.blue[400],
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }));
}
