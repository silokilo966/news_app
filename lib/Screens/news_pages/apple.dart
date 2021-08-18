import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Data/news_widgets.dart';
import 'package:flutter_project/Data/drawer.dart';
import 'package:flutter_project/Data/news_data.dart';
import 'package:provider/provider.dart';

class ApplePage extends StatefulWidget {
  const ApplePage({Key? key}) : super(key: key);

  @override
  _ApplePageState createState() => _ApplePageState();
}

class _ApplePageState extends State<ApplePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String appleAPI =
      'https://newsapi.org/v2/everything?q=apple&from=2021-08-14&to=2021-08-14&sortBy=popularity&apiKey=c0557e054b524723917f9baed16dba4e';

  @override
  void initState() {
    super.initState();

    getUserData();
  }

  void storeUserData(user) {
    Map<String, dynamic> username = user;
    return print("The stored username is: $username");
  }

  Future<void> getUserData() {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    FirebaseAuth _auth = FirebaseAuth.instance;
    Map<String, dynamic>? user;
    return _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then(
      (DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
        if (documentSnapshot.exists) {
          user = documentSnapshot.data();
          print("The user data is: $user");
          storeUserData(user);
        } else
          print("Data doesn't exist");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData(newsApiLink: appleAPI);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerPages(),
        body: RefreshIndicator(
            onRefresh: () async {
              context.read<NewsData>().initialValues();
              context.read<NewsData>().fetchData(newsApiLink: appleAPI);
            },
            child: NewsWidget(scaffoldKey: _scaffoldKey, dateToday: dateToday)),
      ),
    );
  }
}
