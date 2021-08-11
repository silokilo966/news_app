import 'package:flutter/material.dart';
import 'package:flutter_project/Data/news_data.dart';
import 'package:flutter_project/Data/news_widgets.dart';
import 'package:flutter_project/Screens/home_page.dart';
import 'package:provider/provider.dart';

class TeslaPage extends StatefulWidget {
  const TeslaPage({Key? key}) : super(key: key);

  @override
  _TeslaPageState createState() => _TeslaPageState();
}

class _TeslaPageState extends State<TeslaPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String teslaAPI =
      'https://newsapi.org/v2/everything?q=tesla&from=2021-07-010&sortBy=publishedAt&apiKey=c0557e054b524723917f9baed16dba4e';

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData(newsApiLink: teslaAPI);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerPages(),
        body: NewsWidget(scaffoldKey: _scaffoldKey, dateToday: dateToday),
      ),
    );
  }
}
