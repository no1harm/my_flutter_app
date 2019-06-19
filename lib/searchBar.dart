import 'package:flutter/material.dart';


class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  // 相当于从数据库中获取的数据
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('搜索框'),
        // 通过增加 actions，在搜索框尾部添加搜索 Icon
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.search),
            onPressed: (){
               showSearch(context: context,delegate: SearchBarDelegate());
            }
          ),
        ],
      ),
    );
  }
}

// SearchBarDelegate 继承了 SearchDelegate 类后，需要重写四个方法
class SearchBarDelegate extends SearchDelegate<String> {
  static List<String> searchList = [
    "Acfun",
    "BiliBili",
    "CCTV"
  ];
  // 推荐列表
  static List<String> recentSuggest = [
    "recommend - NBS",
    "recommend - TBS",
    "recommend - HKTV"
  ];

  // 点击搜索框内的右侧按钮会将输入框内搜索关键字清空
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon:Icon(Icons.clear),
        onPressed: ()=>query = "",)
      ];
  }

  // 点击搜索框前的左侧按钮将会推出搜索框
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  // 显示搜索内容与结果
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  // 显示搜索推荐内容
   @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
      ));
  }

}