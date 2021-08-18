import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserName with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, dynamic>? user;

  Future<void> getUserName() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      if (documentSnapshot.exists) {
        user = documentSnapshot.data();
        print('$user');
      } else {
        print("Data doesn't exist");
      }
      notifyListeners();
    });
  }
}
