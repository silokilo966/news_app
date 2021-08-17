import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Data/firestore_data.dart';
import 'package:flutter_project/Data/news_data.dart';
import 'package:flutter_project/Data/pages_data.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:provider/provider.dart';

class DrawerPages extends StatefulWidget {
  const DrawerPages({Key? key}) : super(key: key);

  @override
  _DrawerPagesState createState() => _DrawerPagesState();
}

var indexClicked = 0;

//Todo Change the Drawer items color
//todo change the signout color
//Todo change the Drawer to 3d

class _DrawerPagesState extends State<DrawerPages> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<UserName>().getUserName();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          DrawerHeader(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://www.wallpapertip.com/wmimgs/75-755354_background-image-for-navigation-drawer.png'))),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_0.jpg'),
                ),
                SizedBox(height: 1),
                Consumer<UserName>(
                  builder: (context, value, child) {
                    return value.user == null
                        ? CircularProgressIndicator()
                        : Column(
                            children: [
                              Text(
                                "${value.user!['username']}",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${value.user!['email']}",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          );
                  },
                ),
              ],
            ),
          ),

          DrawerHeaderWidget(),
          Expanded(
            child: Container(
              color: Colors.lightGreen[100],
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
                      Navigator.pushReplacementNamed(context, '/');
                      context.read<NewsData>().initialValues();
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
                      context.read<NewsData>().initialValues();
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
                      context.read<NewsData>().initialValues();
                    },
                  ),
                  DrawerListTile(
                    index: 3,
                    onTap: () {
                      setState(() {
                        indexClicked = 3;
                      });
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(
                          context, '/TechCrunchPage');
                      context.read<NewsData>().initialValues();
                    },
                  ),
                  DrawerListTile(
                    index: 4,
                    onTap: () {
                      setState(() {
                        indexClicked = 4;
                      });
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(
                          context, '/WallStreetPage');
                      context.read<NewsData>().initialValues();
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
                    onPressed: () async {
                      await signOut();
                      Navigator.of(context)
                          .pushReplacementNamed(Routes.loginScreen);
                      context.read<NewsData>().initialValues();
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

class DrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://www.wallpapertip.com/wmimgs/75-755354_background-image-for-navigation-drawer.png'))),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_0.jpg'),
          ),
          SizedBox(height: 1),
          Consumer<UserName>(
            builder: (context, value, child) {
              return value.user == null
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        Text(
                          "${value.user!['username']}",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${value.user!['email']}",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}
