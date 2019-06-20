import 'package:flutter/material.dart';

class StaggeredGrid extends StatefulWidget {
  @override
  _StaggeredGridState createState() => _StaggeredGridState();
}

class _StaggeredGridState extends State<StaggeredGrid> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('瀑布流布局'),),
    );
  }
}
