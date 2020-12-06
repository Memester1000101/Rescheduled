import 'package:flutter/material.dart';
import 'package:my_first_app/model/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
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
