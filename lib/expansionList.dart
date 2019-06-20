import 'package:flutter/material.dart';

class ExpansionPanlDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('展开闭合列表'),
      ),
      body: new Container(
        child: ExpansionTile(
          title: Text('Expansion Title'),
          leading: Icon(Icons.list),
          backgroundColor: Colors.white12,
          children: <Widget>[
            ListTile(
              title: Text('list title'),
              subtitle: Text('sub title'),
            ),
          ],
          initiallyExpanded: false,
        ),
      ),
    );
  }
}