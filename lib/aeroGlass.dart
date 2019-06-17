import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

class AeroClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Aero Class'),),
      body: new Stack(
        children: <Widget>[
           ConstrainedBox( //约束盒子组件，添加额外的限制条件到 child上。
            constraints: const BoxConstraints.expand(), //限制条件，可扩展的。
            child:Image.asset('images/40-0.jpg')
          ),
          Center(
            child:ClipRect(
              child: BackdropFilter(
                filter: prefix0.ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 500.0,
                    height: 700.0,
                    decoration: BoxDecoration(color:Colors.grey.shade200),
                    child: Center(
                      child: Text(
                        'Dart',
                        style: Theme.of(context).textTheme.display3, //设置比较酷炫的字体
                      ),
                    ),
                  ),
                ),
              ),
            )
          )
        ],
      )
    );
  }
}