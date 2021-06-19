import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'Login.dart';
import 'SignUp.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  navigatorLogin()async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    // Navigator.pushReplacementNamed(context, "Login");
  }
  navigatorRegister()async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
    // Navigator.pushReplacementNamed(context, "SignUp");
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter exercise file"),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                height: 250,
                width: 250,
                child: Image(image: AssetImage("assets/images/awesome.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                    text: "Welcome to ", style:
                    TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87
                    ),
                    children: [
                      TextSpan(
                        text: "X- Grocerise",style:
                        TextStyle(fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange
                        ),
                      )
                    ]
                  ),
              ),
              Text("Fresh Groceries Delivered at your Doorstep",style:
                TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                      onPressed: (){
                        navigatorLogin();
                    },
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text("LOGIN", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.orange,
                  ),
                  SizedBox(width: 20,),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: (){
                      navigatorRegister();
                    },
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text("REGISTER", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.orange,
                  ),
                ],
              ),
              SizedBox(height: 20,),
              // with custom text
              SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: (){

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
