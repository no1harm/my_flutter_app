import 'package:flutter/material.dart';
import 'custome_router.dart';

class FirstPageScale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('FirstPageScale'),
        elevation: 0.0,
        ), // AppBar 滚动时的融合程度
      body: new Center(
        child: new MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color:Colors.white,
            size:64.0,
          ),
          onPressed: (){
            Navigator.push(context,CustomRouteScale(
              SecondPageScale())
            );
          },
        ),
      ),
    );
  }
}

class SecondPageScale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        leading:Container(),
        backgroundColor: Colors.pinkAccent,
        title: Text('SecondPageScale'),
        elevation: 0.0,),
      body: new Center(
        child: new MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color:Colors.white,
            size:64.0,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}