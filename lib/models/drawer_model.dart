import 'package:flutter/material.dart';

class Defaults {
  static final Color drawerItemColor = Colors.blueGrey;
  static final Color drawerSelectedItemColor = Colors.blue.shade700;

  static final drawerItemsText = [
    'Inbox',
    'Starred',
    'Send',
    'Drafts',
    'Trash',
  ];

  static final drawerItemsIcon = [
    Icons.inbox,
    Icons.star,
    Icons.send,
    Icons.mail,
    Icons.delete,
  ];
}

var indexClicked = 0;

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final drawerPages = [
    Center(
      child: Text("inbox"),
    ),
    Center(
      child: Text("Starred"),
    ),
    Center(
      child: Text("Sent"),
    ),
    Center(
      child: Text("Drafts"),
    ),
    Center(
      child: Text("Trash"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
