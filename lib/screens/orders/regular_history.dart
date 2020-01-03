import 'package:flutter/material.dart';

class RegularOrderHistory extends StatefulWidget {

  final String args;
  RegularOrderHistory({this.args});

  @override
  _RegularOrderHistoryState createState() => _RegularOrderHistoryState();
}

class _RegularOrderHistoryState extends State<RegularOrderHistory> {

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
            Text('You haven\'t placed any regular orders yet'),
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
