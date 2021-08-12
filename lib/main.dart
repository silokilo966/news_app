
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Data/news_data.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

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

        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => NewsData(),
              builder: (context, child) {
                return MaterialApp(
                  navigatorObservers: [NavObserver()],
                  debugShowCheckedModeBanner: false,
                  title: "MyApp",
                  initialRoute: FirebaseAuth.instance.currentUser == null
                      ? Routes.loginScreen
                      : Routes.applePage,
                  onGenerateRoute: Routes.generateRoute,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class NavObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print(
      'DID PUSH: Route = ${route.settings.name} PreviousRoute = ${previousRoute?.settings.name}',
    );
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print(
      'DID REPLACE: NewRoute = ${newRoute?.settings.name} PreviousRoute = ${oldRoute?.settings.name}',
    );
  }
}
