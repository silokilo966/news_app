import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/news_pages/viewpage.dart';
import 'package:provider/provider.dart';
import 'news_data.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required this.dateToday,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final DateTime dateToday;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                offset: Offset(4.0, 4.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4.0, -4.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0)
                          ]),
                      child: IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                          print("Button pressed");
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(110, 0, 0, 0),
                      decoration:
                          BoxDecoration(color: Colors.white.withAlpha(40)),
                      width: 392,
                      height: 87,
                      child: Row(
                        children: [
                          Text(
                            "News",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue[700]),
                          ),
                          Text(
                            "Today",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150, 60, 0, 0),
                    child: Container(
                      width: 100,
                      height: 21,
                      child: Text(
                        "$dateToday",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 0,
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          Consumer<NewsData>(
            builder: (context, value, child) {
              return value.map.length == 0 && !value.error
                  ? Padding(
                      padding: const EdgeInsets.only(top: 260),
                      child: CircularProgressIndicator(),
                    )
                  : value.error
                      ? Text(
                          "${value.errorMessage}",
                          textAlign: TextAlign.center,
                        )
                      : Expanded(
                          child: SizedBox(
                            child: ListView.builder(
                              itemCount: value.map["articles"].length,
                              itemBuilder: (context, index) {
                                return NewsCard(
                                    map: value.map["articles"][index]);
                              },
                            ),
                          ),
                        );
            },
          )
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => NewPageClicked(),
          // ));
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ViewPage(map: map)));
        },
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  '${map['urlToImage']}',
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network('https://via.placeholder.com/350x150');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${map['title']}",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${map['description']}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
