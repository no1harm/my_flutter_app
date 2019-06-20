import 'dart:math';

import 'package:flutter/material.dart';

class CustomCliper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('贝塞尔曲线切割'),backgroundColor: Colors.blueAccent,
      ),
      body:Column(
        children: <Widget>[
          ClipPath( 
            clipper:BottomClipper2(),  // 控制裁剪路径
            child: Container(   // 所要裁剪的子元素
              color:Colors.blueAccent,
              height: 200.0,
            ),
          )
        ],
      )
    );
  }
}

class BottomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
      path.lineTo(0, 0);
      path.lineTo(0, size.height-30);
      var firstControlPoint =Offset(size.width/2,size.height);
      var firstEndPoint = Offset(size.width,size.height-30);

      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

      path.lineTo(size.width, size.height-30);
      path.lineTo(size.width, 0);
    
      return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
  
}


// 波浪形曲线
class BottomClipper2 extends CustomClipper<Path>{
  @override
    Path getClip(Size size) {
      var path = Path();
      path.lineTo(0, size.height-20);
      var firstControlPoint =Offset(size.width/4,size.height);
      var firstEndPoint = Offset(size.width/2.25,size.height-30);

      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

      var secondControlPoint = Offset(size.width/4*3,size.height-80);
      var secondEndPoint = Offset(size.width,size.height-40);

      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

      path.lineTo(size.width, size.height-40);
      path.lineTo(size.width, 0);

      return path;

    }
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
      return false;
    }
  
}

// 剪裁为五角星
class _StarCliper extends CustomClipper<Path>{
  final double radius;
  _StarCliper({this.radius});
  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (pi * degree / 180);
  }
  @override
  Path getClip(Size size) {
    double radius = this.radius;
    Path path = new Path();
    double radian = degree2Radian(36);// 36为五角星的角度
    double radius_in = (radius * sin(radian / 2) / cos(radian)); // 中间五边形的半径
    path.moveTo((radius * cos(radian / 2)), 0.0);// 此点为多边形的起点
    path.lineTo((radius * cos(radian / 2) + radius_in * sin(radian)),
        (radius - radius * sin(radian / 2)));
    path.lineTo((radius * cos(radian / 2) * 2),
        (radius - radius * sin(radian / 2)));
    path.lineTo((radius * cos(radian / 2) + radius_in * cos(radian / 2)),
        (radius + radius_in * sin(radian / 2)));
    path.lineTo((radius * cos(radian / 2) + radius * sin(radian)),
        (radius + radius * cos(radian)));
    path.lineTo((radius * cos(radian / 2)),
        (radius + radius_in));
    path.lineTo((radius * cos(radian / 2) - radius * sin(radian)),
        (radius + radius * cos(radian)));
    path.lineTo((radius * cos(radian / 2) - radius_in * cos(radian / 2)),
        (radius + radius_in * sin(radian / 2)));
    path.lineTo(0.0, (radius - radius * sin(radian / 2)));
    path.lineTo((radius * cos(radian / 2) - radius_in * sin(radian)),
        (radius - radius * sin(radian / 2)));
    path.close();// 使这些点构成封闭的多边形
    return path;
  }
  @override
  bool shouldReclip(_StarCliper oldClipper) {
    return this.radius != oldClipper.radius;
  }
}