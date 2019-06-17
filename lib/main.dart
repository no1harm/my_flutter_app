// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'footer.dart';
import 'anomalyFooter.dart';
import 'routerAnimation.dart';
import 'routerAnimationScale.dart';
import 'routerAnimationRotate.dart';
import 'routerAnimationSlide.dart';
import 'aeroGlass.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme:ThemeData.light(),
      home: new HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title:Text('首页')),
      body: new Container(
        padding: EdgeInsets.all(30.0),
        child : new ListView(
          children: <Widget>[
            new CustomButton(
              title:'底部导航',
              onTap: () => {
                Navigator.push(context,new  MaterialPageRoute(
                  builder:(context) =>new FooterGuide())
                )
              },
            ),
            new CustomButton(
              title:'不规则底部导航',
              onTap: () => {
                Navigator.push(context,new  MaterialPageRoute(
                  builder:(context) =>new AnomalyFooterGuide())
                )
              },
            ),
            new CustomButton(
              title:'路由动画-渐隐',
              onTap: () => {
                Navigator.push(context,new  MaterialPageRoute(
                  builder:(context) =>new FirstPage())
                )
              },
            ),
            new CustomButton(
              title:'路由动画-缩放',
              onTap: () => {
                Navigator.push(context,new  MaterialPageRoute(
                  builder:(context) =>new FirstPageScale())
                )
              },
            ),
            new CustomButton(
              title:'路由动画-旋转',
              onTap: () => {
                Navigator.push(context,new  MaterialPageRoute(
                  builder:(context) =>new FirstPageRotate())
                )
              },
            ),
            new CustomButton(
              title:'路由动画-滑动',
              onTap: () => {
                Navigator.push(context,new  MaterialPageRoute(
                  builder:(context) =>new FirstPageSlide())
                )
              },
            ),
            new CustomButton(
              title:'毛玻璃效果',
              onTap: () => {
                Navigator.push(context,new  MaterialPageRoute(
                  builder:(context) =>new AeroClass())
                )
              },
            ),
          ],
        )
      )
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const CustomButton({Key key, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      color: Colors.lightBlueAccent,
      textColor: Colors.white,
      child: Text(title),
      onPressed: onTap,
    );
  }
}