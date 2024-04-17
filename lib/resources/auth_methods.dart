import 'dart:ffi';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/model/user_model.dart' as model;
import 'package:login/resources/StorageMethods.dart';

import '../model/user_model.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('student').doc(currentUser.uid).get();

    return model.UserModel.fromSnap(documentSnapshot);
  }


 Future<void> signOut() async {
    await _auth.signOut();
  }

  var userData = {};
  Future<String> getdata() async {
    User? user = _auth.currentUser!;
    String id = '';
    var db = await FirebaseFirestore.instance
        //.collection('posts')
        .doc(user.uid)
        .get();
    userData = db.data()!;
    //id = userData['role'];
    return id;
  }
}

