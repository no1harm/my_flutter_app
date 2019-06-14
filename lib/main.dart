// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new FirstScreen()
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: new Center(
        child: new RaisedButton(
          textTheme: ButtonTextTheme.accent,
          color: Colors.white,
          child: Text('查看商品详情页'),
          onPressed: (){
            Navigator.push(context,new  MaterialPageRoute(
              builder:(context) =>new SecondScreen())
            );
          }
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('商品详情页'),
      ),
      body: new Center(
        child: new RaisedButton(
          textTheme: ButtonTextTheme.accent,
          color: Colors.white,
          child: Text('前往个人页面'),
          onPressed: (){
            Navigator.push(context,new  MaterialPageRoute(
              builder:(context) =>new ThirdScreen())
            );
          }
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('个人页面'),
      ),
      body: new Center(
        child: new RaisedButton(
          textTheme: ButtonTextTheme.accent,
          color: Colors.white,
          child: Text('返回首页'),
          onPressed: (){
            Navigator.push(context,new  MaterialPageRoute(
              builder:(context) =>new FirstScreen())
            );
          }
        ),
      ),
    );
  }
}