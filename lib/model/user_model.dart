import 'package:cloud_firestore/cloud_firestore.dart';


class UserModel {
  final String uid;
  final String? email;
  final String firstName;
  final String? lastName;

  const UserModel({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      uid: snapshot['uid'],
      email: snapshot['email'],
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'firstName': firstName,
        'secondName': lastName,
      };
}

