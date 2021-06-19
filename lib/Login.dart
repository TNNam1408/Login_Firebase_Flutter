import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterexercisefile/HomePage.dart';

import 'SignUp.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  checkAuthentification() async{
    _auth.onAuthStateChanged.listen((user) {
      if(user !=null){
        print(user);
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> HomePage()
            ));
        // Navigator.pushReplacementNamed(context, "HomePage");
      }
    });
  }
  @override
  void initState() {
    this.checkAuthentification();
    super.initState();
  }
  login()async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
         AuthResult user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      }catch(e){
        showError(e.message);
      }
    }
  }
  showError(String errormessage){
    showDialog(context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Error"),
          content: Text(errormessage),
          actions: [
            // ignore: deprecated_member_use
            FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
  navigateToSignUp()async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  width: 250,
                  child: Image(image: AssetImage("assets/images/camera.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Form(
                    key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //input email
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                // ignore: missing_return
                                validator: (input){
                                  if(input.isEmpty)
                                  return 'Enter email.';
                                  },
                                  decoration: InputDecoration(
                                    labelText:'Email',
                                    prefixIcon: Icon(Icons.email),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                  ),
                                  onSaved:(input)=> _email = input
                              ),
                            ),
                          ),
                          
                          //input password
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                  // ignore: missing_return
                                  validator: (input) {
                                    if(input.length < 6)
                                    return 'Provide Minimum 6 Character.';
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      prefixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                    ),
                                    obscureText: true,
                                    onSaved:(input)=> _password = input,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                              onPressed: (){
                                login();
                              },
                            padding: EdgeInsets.only(left: 50, right: 50),
                            child: Text("LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            color: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  child: Text("Creat an Account?",style: TextStyle(fontSize: 20),),
                  onTap: navigateToSignUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
