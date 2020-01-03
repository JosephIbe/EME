import 'package:flutter/material.dart';
import 'package:my_eme/utils/constants.dart';
import 'package:my_eme/utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  //  final String title;
//  final Widget child;
  final Function onDrawerPressed;
  final Function onSearchPressed;

  CustomAppBar({this.onDrawerPressed, this.onSearchPressed});

//  CustomAppBar({this.title});
//  CustomAppBar({this.title, this.child, this.onPressed});

  @override
  Size get preferredSize => Size.fromHeight(85.0);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        body: Container(
          height: 100.0,
          width: double.infinity,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.brown[300],
                  ),
                  onPressed: onDrawerPressed),
              Text(appBarTitle, style: appBarTitleStyle,),
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.brown[300],
                  ),
                  onPressed: onSearchPressed)
            ],
          ),
        ),
      ),
    );
  }
}
