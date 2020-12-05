import 'package:flutter/material.dart';
import 'Login.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
  // Set the path to the database. Note: Using the `join` function from the
  // `path` package is best practice to ensure the path is correctly
  // constructed for each platform.
  join(await getDatabasesPath(), 'database.db'),
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new LoginScreen(),
    );
  }
}
