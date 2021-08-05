import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user == null) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "News App",
                initialRoute: Routes.loginScreen,
                onGenerateRoute: Routes.generateRoute,
              );
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "News App",
              initialRoute: Routes.homePage,
              onGenerateRoute: Routes.generateRoute,
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text("Firebase Loading.."),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
