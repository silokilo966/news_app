import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              child: Text("Sign Out"),
              onPressed: () {
                signOut();
                Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
              },
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          alignment: Alignment.topCenter,
          child: Text(
            "Home Page",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    ));
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
