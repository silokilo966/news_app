import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/pages_data.dart';
import 'package:flutter_project/routes/routes.dart';

class DrawerPages extends StatefulWidget {
  const DrawerPages({Key? key}) : super(key: key);

  @override
  _DrawerPagesState createState() => _DrawerPagesState();
}

var indexClicked = 0;

final pages = [
  Center(
    child: Text('Inbox'),
  ),
  Center(
    child: Text('Starred'),
  ),
  Center(
    child: Text('Sent'),
  ),
  Center(
    child: Text('Drafts'),
  ),
  Center(
    child: Text('Trash'),
  ),
  Center(
    child: Text('Spam'),
  ),
];

//Todo Change the Drawer items color
//todo change the signout color
//Todo change the Drawer to 3d

class _DrawerPagesState extends State<DrawerPages> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerListTile(
                  index: 0,
                  onTap: () {
                    setState(() {
                      indexClicked = 0;
                    });
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/ApplePage');
                  },
                ),
                DrawerListTile(
                  index: 1,
                  onTap: () {
                    setState(() {
                      indexClicked = 1;
                    });
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/TeslaPage');
                  },
                ),
                DrawerListTile(
                  index: 2,
                  onTap: () {
                    setState(() {
                      indexClicked = 2;
                    });
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/BusinessPage');
                  },
                ),
                DrawerListTile(
                  index: 3,
                  onTap: () {
                    setState(() {
                      indexClicked = 3;
                    });
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/TechCrunchPage');
                  },
                ),
                DrawerListTile(
                  index: 4,
                  onTap: () {
                    setState(() {
                      indexClicked = 4;
                    });
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/WallStreetPage');
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    signOut();
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.loginScreen);
                  },
                  child: Text(
                    "Sign Out",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
