import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await FirebaseAuth.instance.authStateChanges().first;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
            //Todo Add splashscreen
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "MyApp",
          initialRoute: FirebaseAuth.instance.currentUser == null
              ? Routes.loginScreen
              : Routes.homePage,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
