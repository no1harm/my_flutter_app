import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class RightBackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 使用 CupertinoPageScaffold
    return new CupertinoPageScaffold(
      child: Center(
        child: Container(
          height: 200.0,
          width: 100.0,
          color: CupertinoColors.lightBackgroundGray,
          child: CupertinoButton(
            child: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (BuildContext context){
                  return MyApp();
                })
              );
            },
          ),
        ),
      ),
    );
  }
}