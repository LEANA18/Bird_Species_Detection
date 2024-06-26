import 'package:login/Screen/homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/Screen/MainReg.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  var userData = {};
  bool isLoading = false;
//Firebase
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailfield = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Email ",
          hintStyle: TextStyle(color: Colors.grey[400])),
    );

    final passwordfield = TextFormField(
      autofocus: false,
      controller: passwordcontroller,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter Password");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password (Min. 6 Character)");
        }
        return null;
      },
      onSaved: (value) {
        passwordcontroller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.grey[400])),
    );
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
            
              child: Column(
                children: <Widget>[
                  Image.asset(
              'assets/logo.png',  // Path to your image asset
              width: 200,
              height: 200,
              // You can adjust the width, height, and other properties based on your design
            ),
            SizedBox(height: 5),
                  Container(
                    height: 200,
                    child: Stack(
                      children: <Widget>[
                    
                        Positioned(
                            child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    child: emailfield),
                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: passwordfield)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 3, 68, 122),
                                  Color.fromARGB(255, 12, 108, 204),
                                ])),
                            child: GestureDetector(
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onTap: () {
                                signIn(emailcontroller.text,
                                    passwordcontroller.text);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: GestureDetector(
                              child: Center(
                                child: Text(
                                  "Don't have an account? SignUp",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationScreen(),
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void signIn(String uid, String password) async {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          isLoading = true;
        });
        await _auth
            .signInWithEmailAndPassword(email: uid, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                });



       User? user = _auth.currentUser!;
        var db = await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .get();
        userData = db.data()!;

        Navigator.of(context).pushReplacement(
            
            MaterialPageRoute(builder: (context) => Bottomnav()));


        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
      );
      setState(() {
        isLoading = false;
      });
    }
  }
}
