import 'package:flutter/material.dart';


// 渐隐
class CustomRouteFade extends PageRouteBuilder{
  final Widget widget;
  CustomRouteFade(this.widget)
    :super(
      transitionDuration:const Duration(seconds:1),
      pageBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2){
          return widget;
        },
     transitionsBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget child){
            return FadeTransition(
              opacity: Tween(begin:0.0,end :1.0).animate(CurvedAnimation(
                  parent:animation1,
                  curve:Curves.fastOutSlowIn
              )),
              child: child,
            );
        }  
      
    ); 
}

// 缩放
class CustomRouteScale extends PageRouteBuilder {
  
  final Widget widget;
  CustomRouteScale(this.widget)
    :super(
      transitionDuration:const Duration(seconds:1),
      pageBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2){
          return widget;
        },
     transitionsBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
        Widget child){
          return ScaleTransition(
          scale:Tween(begin:0.0,end:1.0).animate(CurvedAnimation(
            parent:animation1,
            curve: Curves.fastOutSlowIn
            )),
            child:child
        );
      }  
    ); 
}

// 旋转加缩放
class CustomRouteScaleAndRotate extends PageRouteBuilder {
  final Widget widget;
  CustomRouteScaleAndRotate(this.widget)
    :super(
      transitionDuration:const Duration(seconds:1),
      pageBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2){
          return widget;
        },
     transitionsBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
        Widget child){
          return RotationTransition(
          turns:Tween(begin:0.0,end:1.0)
          .animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn
          )),
          child:ScaleTransition(
            scale:Tween(begin: 0.0,end:1.0)
            .animate(CurvedAnimation(
                parent: animation1,
                curve:Curves.fastOutSlowIn
            )),
            child: child,
          )
        );
      }  
    ); 
}

// 左右滑动
class CustomRouteSlide extends PageRouteBuilder {
  final Widget widget;
  CustomRouteSlide(this.widget)
    :super(
      transitionDuration:const Duration(milliseconds:500),
      pageBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2){
          return widget;
        },
     transitionsBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
        Widget child){
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(-1.0, 0.0),
              end:Offset(0.0, 0.0)
            )
            .animate(CurvedAnimation(
              parent: animation1,
              curve: Curves.fastOutSlowIn
            )),
            child: child,
          );
      }  
      
    ); 
}

