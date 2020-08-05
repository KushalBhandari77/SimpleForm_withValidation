import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LoginUI",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyPage(),
    );
  }
}
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState.validate()){
      print("Ok");
    }else{
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder()
                  ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Required"),
                      EmailValidator(errorText: "not valid"),
                    ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder()
                    ),
                    validator:  MultiValidator([
                      RequiredValidator(errorText: "Required"),
                      MinLengthValidator(8,errorText: "Must be more than 8")
                    ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    onPressed: (){},
                    child: Text("Login"),
                    color: Colors.red,
                    splashColor: Colors.amber,
                    hoverColor: Colors.green,
                  ),
                )
              ],
            ),
          ),
        ),
      ),


    );
  }
}

