import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  ViewPage({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white.withAlpha(500),
        title: Text(
          "News Today",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 1,
          child: Column(
            children: [
              Image.network("${widget.map['urlToImage']}"),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 4, 0, 0),
                child: Text(
                  "${widget.map['title']}",
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
                      Text("${widget.map['author']}",
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
                    child: Text("${widget.map['publishedAt']}")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${widget.map['description']}",
                      style: TextStyle(fontSize: 22),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${widget.map['content']}",
                      style: TextStyle(fontSize: 22),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${widget.map['description']}",
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
