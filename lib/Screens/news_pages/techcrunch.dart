import 'package:flutter/material.dart';
import 'package:flutter_project/Data/news_data.dart';
import 'package:flutter_project/Data/news_widgets.dart';
import 'package:flutter_project/Screens/home_page.dart';
import 'package:provider/provider.dart';

class TechcrunchPage extends StatefulWidget {
  const TechcrunchPage({Key? key}) : super(key: key);

  @override
  _TechcrunchPageState createState() => _TechcrunchPageState();
}

class _TechcrunchPageState extends State<TechcrunchPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String techCrunchAPI =
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c0557e054b524723917f9baed16dba4e';

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData(newsApiLink: techCrunchAPI);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerPages(),
        body: RefreshIndicator(
            onRefresh: () async {
              await context
                  .read<NewsData>()
                  .fetchData(newsApiLink: techCrunchAPI);
            },
            child: NewsWidget(scaffoldKey: _scaffoldKey, dateToday: dateToday)),
      ),
    );
  }
}
