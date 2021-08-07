import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/home_page.dart';

class TeslaPage extends StatefulWidget {
  const TeslaPage({Key? key}) : super(key: key);

  @override
  _TeslaPageState createState() => _TeslaPageState();
}

class _TeslaPageState extends State<TeslaPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerPages(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: 35,
              ),
            ),
          ),
          Center(
            child: Text('Home'),
          )
        ],
      ),
    );
  }
}
