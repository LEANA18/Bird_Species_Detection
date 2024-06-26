import 'package:login/Screen/homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/model/user_model.dart' as model;


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final firstNameEditingController = new TextEditingController();
  final lastNameEditingController = new TextEditingController();
  final UIDNameEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmNameEditingController = new TextEditingController();

  bool isLoading = false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final firstfield = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(IconData(0xe043, fontFamily: 'MaterialIcons')),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          )),
    );

    final secfield = TextFormField(
      autofocus: false,
      controller: lastNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Last Name cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        lastNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(IconData(0xe043, fontFamily: 'MaterialIcons')),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          )),
    );

    final UIDfield = TextFormField(
      autofocus: false,
      controller: UIDNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid Mail");
        }
        return null;
      },
      onSaved: (value) {
        UIDNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(IconData(0xe043, fontFamily: 'MaterialIcons')),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "UID",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          )),
    );

    final passfield = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      keyboardType: TextInputType.name,
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
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          )),
    );

    final NextButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(40),
      color: Color.fromARGB(255, 3, 68, 122),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUser(
            email: UIDNameEditingController.text,
            password: passwordEditingController.text,
          );
        },
        child: Container(
            child: Text(
          "Next",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
                child: Container(
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.all(36.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 30),
                          Text(
                            "REGISTRATION FORM",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 25),
                          SizedBox(height: 5),
                          firstfield,
                          SizedBox(height: 5),
                          secfield,
                          SizedBox(height: 5),
                          UIDfield,
                          SizedBox(height: 5),
                          passfield,
                          SizedBox(height: 40),
                          NextButton,
                        ],
                      ))),
            )),
          )),
    );
  }

  Future<String> signUser({
    required String email,
    required String password,
  }) async {
    setState(() {
      isLoading = true;
    });
    String role = "user";
    String res = "Some error occured";
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          isLoading = true;
        });
      
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        model.UserModel userModel = model.UserModel(
          uid: cred.user!.uid,
          email: email,
          firstName: firstNameEditingController.text,
          lastName: lastNameEditingController.text,
        );

        await _firestore
            .collection("user")
            .doc(cred.user!.uid)
            .set(userModel.toJson());
        setState(() {
          isLoading = false;
        });

        Fluttertoast.showToast(msg: "Account created Successfully");
        Navigator.pushAndRemoveUntil(
            (context),
            
            MaterialPageRoute(builder: (context) => Bottomnav()),

            (route) => false);
      } else {
        res = "Please enter all the fields";
        Fluttertoast.showToast(msg: "Please enter all the fields");
      }
    } catch (err) {
      res = err.toString();
      setState(() {
        isLoading = false;
      });
    }

    return res;
  }
}
