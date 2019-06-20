import 'package:flutter/material.dart';

class ExpansionListsDemo extends StatefulWidget {
  @override
  _ExpansionListsDemoState createState() => _ExpansionListsDemoState();
}

class _ExpansionListsDemoState extends State<ExpansionListsDemo> {
  var currentPanelIndex = -1;
  List<int> mList;  // 控制索引
  List<ExpandStateBean> expandStateList;  // 开展后的状态列表
  _ExpansionListsDemoState(){
    mList = new List();
    expandStateList = new List();
    for(int i=0;i<10;i++){
      mList.add(i);
      expandStateList.add(ExpandStateBean(i,false));
    }
  }
  _setCurrentIndex(int index, isExpand){
    setState(() {
      // 遍历可展开状态列表
      expandStateList.forEach((item){
        if(item.index == index){
          //取反，经典取反方法
          item.isOpen = !isExpand;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('展开闭合列表'),
      ),
      body:SingleChildScrollView(
        child: ExpansionPanelList(
          //交互回调属性，里边是个匿名函数，控制列表项的展开与闭合
          expansionCallback: (index,bol){
            //调用内部方法
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index){  //进行map操作，然后用toList再次组成List
            return ExpansionPanel(
              headerBuilder: (context,isExpanded){
                return ListTile(
                  title:Text('This is No. $index')
                );
              },
              body:ListTile(
                title:Text('expansion no.$index')
              ),
              isExpanded: expandStateList[index].isOpen
            );
          }).toList(),
        ),
      )
    );
  }
}

class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean(this.index,this.isOpen);
}