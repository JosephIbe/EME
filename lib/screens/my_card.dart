import 'package:flutter/material.dart';
import 'package:my_eme/utils/custom_vert_divider.dart';

class MyCard extends StatefulWidget {

  final String args;
  MyCard({this.args});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, ()=> this.fetchCardHistory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args}'),
        centerTitle: false,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: fetchCardHistory)
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0,),
              child: Text('Will add date picker later'),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 1.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Date'),
                  MyVerticalDivider(color: Colors.brown, height: 20.0, left: 8.0, right: 5.0,),
                  Text('Sold'),
                  MyVerticalDivider(color: Colors.brown, height: 20.0, left: 8.0, right: 5.0,),
                  Text('Empty'),
                  MyVerticalDivider(color: Colors.brown, height: 20.0, left: 8.0, right: 5.0,),
                  Text('Bal'),
                  MyVerticalDivider(color: Colors.brown, height: 20.0, left: 0.0, right: 5.0,),
                  Text('Sign', textAlign: TextAlign.center,),
                ],
              ),
            ),
            Expanded(
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.help),
                      SizedBox(height: 10.0,),
                      Text('Records don\'t exist for this month'),
                    ],
                  ),
            ),
            Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('Daily', style: TextStyle(color: Colors.white),),
                            Text('Total', style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        MyVerticalDivider(color: Colors.white, height: 40.0, left: 0, right: 0,),
                        Column(
                          children: <Widget>[
                            Text('Sold', style: TextStyle(color: Colors.white),),
                            Text('0', style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        MyVerticalDivider(color: Colors.white, height: 40.0, left: 0, right: 0,),
                        Column(
                          children: <Widget>[
                            Text('Empty', style: TextStyle(color: Colors.white),),
                            Text('0', style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        MyVerticalDivider(color: Colors.white, height: 40.0, left: 0, right: 0,),
                        Column(
                          children: <Widget>[
                            Text('Balance', style: TextStyle(color: Colors.white),),
                            Text('0', style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void fetchCardHistory() {
    showDialog(context: context, barrierDismissible: false, builder: (context){
      Future.delayed(Duration(seconds: 2), ()=> Navigator.of(context).pop());
      return AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              Spacer(),
              Text('Loading...Please wait', textAlign: TextAlign.center,),
            ],
          )
      );
    });
  }

}
