import 'package:flutter/material.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  // 初始化动画控制器
  AnimationController _controller;
  Animation _animation;

  void initState(){
    super.initState();
    _controller = AnimationController(vsync:this,duration:Duration(milliseconds:3000));
    _animation = Tween(begin: 0.0,end:1.0).animate(_controller);
    
    // 监听动画执行状态，结束后执行页面跳转动作，并销毁组件
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context)=> MyApp()), 
          (route)=> route==null);
      }
    });

    //播放动画
    _controller.forward();
  }

  // 销毁组件
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new FadeTransition(  // 透明度动画组件
      opacity:_animation,   // 执行动画
      child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561033643864&di=57041a9fd35440e113064c8eda846b07&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20171123%2F28718918f8174f858e5eb5f4b7948b3b.gif',
        scale: 2.0, //进行缩放
        fit: BoxFit.cover,  // 充满父容器
      ),
    );
  }
}