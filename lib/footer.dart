import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';


class FooterGuide extends StatefulWidget {
  @override
  _FooterGuideState createState() => _FooterGuideState();
}

class _FooterGuideState extends State<FooterGuide> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;  // 定义初始值
  List<Widget> list = List();
  @override
  void initState(){ // 初始化 类似于 Vue 中的 created 钩子
    list  // ..add() 返回调用者本身 list后用了..add()，还会返回list，然后就一直使用..语法，能一直想list里增加widget元素。
      ..add(FooterGuideHome())
      ..add(FooterGuideEmail())
      ..add(FooterGuidePages())
      ..add(FooterGuideAliplay());   
    super.initState();  // 调用父类的 initState()   
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('底部导航'),
      ),
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor:Colors.white10,
        currentIndex: _currentIndex,
        type:BottomNavigationBarType.fixed,
        onTap: (int index){
          setState((){  // 改变状态 类似于 Vue 中的 $set
            _currentIndex = index;
          });
        },
        items: [
           BottomNavigationBarItem(
             icon:Icon(
               Icons.home,
               color:_bottomNavigationColor,
             ),
             title:Text(
               'Home',
               style:TextStyle(color:_bottomNavigationColor)
             ),
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.email,
               color:_bottomNavigationColor,
             ),
             title:Text(
               'Email',
               style:TextStyle(color:_bottomNavigationColor)
             )
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.pages,
               color:_bottomNavigationColor,
             ),
             title:Text(
               'Pages',
               style:TextStyle(color:_bottomNavigationColor)
             )
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.airplay,
               color:_bottomNavigationColor,
             ),
             title:Text(
               'AipPlay',
               style:TextStyle(color:_bottomNavigationColor)
             )
           ),
         ],
      ),
    );
  }
}

class FooterGuideHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(
        child: Text('回到首页'),
        onPressed: ()=>{
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=> MyApp())
          )
        },
      ),
    );
  }
}

class FooterGuideEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(
        child: Text('回到首页'),
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=> MyApp())
          );
        },
      ),
    );
  }
}

class FooterGuidePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(
        child: Text('回到首页'),
        onPressed: ()=>{
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=> MyApp())
          )
        },
      ),
    );
  }
}

class FooterGuideAliplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(
        child: Text('回到首页'),
        onPressed: ()=>{
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=> MyApp())
          )
        },
      ),
    );
  }
}