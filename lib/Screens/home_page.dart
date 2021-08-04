import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          alignment: Alignment.topCenter,
          child: Text(
            "Home Page",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        Center(
          child: Text("Welcome to HomePage"),
        ),
      ],
    ));
  }
}
