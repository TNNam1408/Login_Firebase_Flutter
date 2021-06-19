import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterexercisefile/Start.dart';
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  bool isloggedin = false;

  checkAuthentification() async{
    _auth.onAuthStateChanged.listen((user) {
      if(user == null){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>Start()),
        );
        // Navigator.pushReplacementNamed(context, "Start");
      }
    });
  }
  getUser() async{
    FirebaseUser firebaseUser = await _auth.currentUser();
    await firebaseUser ?.reload();
    firebaseUser = await _auth.currentUser();

    if(firebaseUser != null){
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }
  @override
  void initState() {
    this.checkAuthentification();
    this.getUser();
    super.initState();
  }
  signOut(){
    _auth.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: !isloggedin ? CircularProgressIndicator():
              Column(
                children: [
                  Container(
                    height: 250,
                    child: Image(
                      image: AssetImage("assets/images/error.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Hello ${user.displayName} you are Logged is as ${user.email}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: (){
                      signOut();
                    },
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: Text("SIGN OUT",
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
    );
  }
}
