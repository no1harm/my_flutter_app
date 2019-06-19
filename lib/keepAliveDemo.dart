import 'package:flutter/material.dart';

class KeepAlivePage extends StatefulWidget {
  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}
/*
with是dart的关键字，意思是混入的意思，

就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类，

避免多重继承导致的问题。

SingleTickerProviderStateMixin 主要是我们初始化TabController时，

需要用到vsync ，垂直属性，然后传递this
*/
class _KeepAlivePageState extends State<KeepAlivePage> with SingleTickerProviderStateMixin{
  TabController _controller;
  @override
  void initState(){
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }
  //重写被释放的方法，只释放TabController
   @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('keepAlivePage'),
        elevation: 0.0,
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon:Icon(Icons.directions_car)),
            Tab(icon:Icon(Icons.directions_transit)),
            Tab(icon:Icon(Icons.directions_bike)),
          ],
        ),
      ),
      body:TabBarView(
        controller: _controller,
        children: <Widget>[
         HomePage(),
         HomePage(),
         HomePage(),
        ],
      )
      
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
// 混入 AutomaticKeepAliveClientMixin ，保持状态的关键
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  // 声明变量初始值
  int _counter = 0;
  // 重写keepAlive 为ture ，就是可以有记忆功能了。
  @override
  bool get wantKeepAlive => true;
  void _incrementCounter(){
    setState(() {
     _counter++; 
    });
  }
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        body: new Center(
          child: Text('$_counter',style: Theme.of(context).textTheme.display1,),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter, // 悬浮按钮点击事件
          tooltip: 'Hello World', // 悬浮按钮长按显示
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      );
  }
}