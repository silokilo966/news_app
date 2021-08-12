import 'package:flutter/material.dart';
import 'package:flutter_project/Data/news_data.dart';
import 'package:flutter_project/Data/news_widgets.dart';
import 'package:flutter_project/Screens/home_page.dart';
import 'package:provider/provider.dart';

class WallstreetPage extends StatefulWidget {
  const WallstreetPage({Key? key}) : super(key: key);

  @override
  _WallstreetPageState createState() => _WallstreetPageState();
}

class _WallstreetPageState extends State<WallstreetPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String wallstreetAPI =
      'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=c0557e054b524723917f9baed16dba4e';

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData(newsApiLink: wallstreetAPI);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerPages(),
        body: RefreshIndicator(
            onRefresh: () async {
              await context
                  .read<NewsData>()
                  .fetchData(newsApiLink: wallstreetAPI);
            },
            child: NewsWidget(scaffoldKey: _scaffoldKey, dateToday: dateToday)),
      ),
    );
  }
}
