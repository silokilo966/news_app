import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  final Map<String, dynamic> map;
  ViewPage({
    Key? key,
    required this.map,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text("Test"),
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 1,
          child: Column(
            children: [
              Image.network("${map['urlToImage']}"),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 4, 0, 0),
                child: Text(
                  "${map['title']}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text(
                        "Author: ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("${map['author']}",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text("${map['publishedAt']}")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${map['description']}",
                      style: TextStyle(fontSize: 22),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${map['content']}",
                      style: TextStyle(fontSize: 22),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${map['description']}",
                      style: TextStyle(fontSize: 22),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
