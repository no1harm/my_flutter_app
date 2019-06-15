import 'package:flutter/material.dart';

class AnomalyFooterGuide extends StatefulWidget {
  @override
  _AnomalyFooterGuideState createState() => _AnomalyFooterGuideState();
}

class _AnomalyFooterGuideState extends State<AnomalyFooterGuide> {
  List<Widget> list = List();
  int _currentIndex = 0;
  @override
  void initState(){
    list..add(AnomalyFooterPageGenarator('home'))..add(AnomalyFooterPageGenarator('cart'));
    super.initState();
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('不规则底部导航'),
      ),
      body: new Center(
        child: Text('data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){}, // 悬浮按钮点击事件
        tooltip: 'Hello World', // 悬浮按钮长按显示
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,  // 当悬浮按钮要与底部导航栏融合时的必填选项
      bottomNavigationBar: BottomAppBar(  // 底部工具栏，可以防止文字、图标、widget
        color:Colors.lightBlue,
        shape:CircularNotchedRectangle(), // 为了和 floatingActionButton 融合
        child: Row(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
             IconButton(
               icon:Icon(Icons.home),
               color:Colors.white,
               onPressed:(){
                
               }
             ),
             IconButton(
               icon:Icon(Icons.airport_shuttle),
               color:Colors.white,
               onPressed:(){
                 
               }
             ),
           ],
         ),
      ),
    );
  }
}

class AnomalyFooterPageGenarator extends StatefulWidget {
  String _title;
  AnomalyFooterPageGenarator(this._title);

  @override
  _AnomalyFooterPageGenaratorState createState() => _AnomalyFooterPageGenaratorState();
}

class _AnomalyFooterPageGenaratorState extends State<AnomalyFooterPageGenarator> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(widget._title),),
      body: new Center(
        child: Text(widget._title),
      ),
    );
  }
}