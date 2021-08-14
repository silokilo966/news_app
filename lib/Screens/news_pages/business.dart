import 'package:flutter/material.dart';
import 'package:flutter_project/Data/news_data.dart';
import 'package:flutter_project/Data/news_widgets.dart';
import 'package:flutter_project/Data/drawer.dart';
import 'package:provider/provider.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String businessAPI =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c0557e054b524723917f9baed16dba4e';

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData(newsApiLink: businessAPI);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerPages(),
        body: RefreshIndicator(
            onRefresh: () async {
              await context
                  .read<NewsData>()
                  .fetchData(newsApiLink: businessAPI);
            },
            child: NewsWidget(scaffoldKey: _scaffoldKey, dateToday: dateToday)),
      ),
    );
  }
}
