import 'package:flutter/material.dart';
import 'package:my_first_app/pages/newtimetable.dart';
import 'package:my_first_app/util/user.dart';
import 'package:my_first_app/util/db_helper.dart';
class LoginScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(title: 'Flutter Login'),
    );
  }
}

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {

  Future<List<User>>user;
  TextEditingController controller = TextEditingController();
  int id;
  String username;
  String password;

  final formKey = new GlobalKey<FormState>();
  var dbHelper;
  bool isUpdating;

  List<User> userList;
  @override
  void initState(){
    super.initState();
    DBHelper.instance.getUsers().then((value){
      setState(() {
        userList = value;
      });
    });
  }


validate(){
  if(formKey.currentState.validate()){
    formKey.currentState.save();
    if(isUpdating){
      User x = User(id, username, password);
      dbHelper.update(x);
      setState((){
        isUpdating = false;
      });
    }else{
      User x = User(null, username, password);
      dbHelper.save(x);
    }
  }
}
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final usernameField = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (formKey.currentState.validate()) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Timetable()));
    }
  },

        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 45.0),
                usernameField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
                Text('Forgot Password?'),
                SizedBox(height: 15.0),
                Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                  )),
                  Text("   or   "),
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                  )),
                ]),
                SizedBox(height: 15.0),
                Text('Log in with Facebook'),
                SizedBox(height: 5.0),
                Text('Log in with Google'),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
