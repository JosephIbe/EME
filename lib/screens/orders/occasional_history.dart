import 'package:flutter/material.dart';

class OccasionalOrderHistory extends StatefulWidget {

  final String args;
  OccasionalOrderHistory({this.args});

  @override
  _OccasionalOrderHistoryState createState() => _OccasionalOrderHistoryState();
}

class _OccasionalOrderHistoryState extends State<OccasionalOrderHistory> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, ()=> this.fetchHistory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${widget.args}'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.help),
            SizedBox(height: 10.0,),
            Text('You haven\'t placed any occasional orders yet'),
          ],
        ),
      ),
    );
  }

  void fetchHistory() {
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
