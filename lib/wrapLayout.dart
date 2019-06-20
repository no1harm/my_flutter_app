import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class WrapLayout extends StatefulWidget {
  @override
  _WrapLayoutState createState() => _WrapLayoutState();
}

class _WrapLayoutState extends State<WrapLayout> {
  List<Widget> list;
  @override
  //初始化状态，给list添加值，这时候调用了一个自定义方法 `buildAddButton`
  void initState() { 
    super.initState();
      list = List<Widget>()..add(buildAddButton());
    }
    @override
    Widget build(BuildContext context) {
      // 获取设备屏幕宽高
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;

      return new Scaffold(
        appBar: AppBar(title:Text('流式布局'),
        ),
        body: new Container(
          padding: EdgeInsets.all(10.0),
          width: width,
          height: height,
          // Wrap流式
          child: Wrap(
            children: list,
            spacing: 8.0,
          ),
        ),
      );
    }
    Widget buildAddButton() {
      // GestureDetector 是一个Widget，但没有任何的显示功能，而只是一个手势操作，用来触发事件的。
      // GestureDetector 可以让一些默认没有触发事件的组件拥有触发事件
      return GestureDetector(
        onTap: (){
          setState(() {
            if(list.length < 9){
              // 插入数组成员
              list.insert(list.length-1, buildPhoto());
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 100.0,
            height: 120.0,
            child: Icon(Icons.add,color: Colors.black12,),
            decoration: new BoxDecoration(
              border: Border.all(width: 1.0,color: Colors.black12,style: BorderStyle.solid),
              color: Colors.white, 
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      );
    }

    Widget buildPhoto(){
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 100.0,
            height: 120.0,
            child: Center(
              child: Text('照片'),
            ),
            decoration: new BoxDecoration(
              border: Border.all(width: 1.0,color: Colors.black12,style: BorderStyle.solid),
              color: Colors.white12, 
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
      );
    }
  }
    