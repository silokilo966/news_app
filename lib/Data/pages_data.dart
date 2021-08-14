import 'package:flutter/material.dart';
import 'package:flutter_project/Data/drawer.dart';

import '../models/drawer_model.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        Defaults.drawerItemsIcon[index],
        size: 35,
        color: indexClicked == index
            ? Defaults.drawerSelectedItemColor
            : Defaults.drawerItemColor,
      ),
      title: Text(Defaults.drawerItemsText[index],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: indexClicked == index
                ? Defaults.drawerSelectedItemColor
                : Defaults.drawerItemColor,
          )),
    );
  }
}
