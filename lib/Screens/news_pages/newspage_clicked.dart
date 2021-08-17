import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  ViewPage({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70.withAlpha(500),
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "News Today",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network("${map['urlToImage']}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "${map['title']}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "Author:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${map['author']}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${map['publishedAt']}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${map['description']}",
                    style: TextStyle(fontSize: 19),
                  ),
                  Text(
                    "${map['content']}",
                    style: TextStyle(fontSize: 19),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
