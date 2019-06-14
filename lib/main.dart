// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new FirstScreen()
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ProductList(
        productList: new List<Product>.generate(10, (i)=>Product('商品 $i','这是一个商品详情，编号为:$i')),
      )
    );
  }
}

class Product {
  final String title;
  final String description;

  Product(this.title, this.description);
}

class ProductList extends StatelessWidget {
  final List<Product> productList;

  const ProductList({Key key,@required this.productList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title:Text('商品列表')),
      body: new ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context,index){
          return ListTile(
            leading: new Icon(Icons.shop),
            title:Text(productList[index].title),
            subtitle: Text(productList[index].description),
            onTap: (){},
          );
        },
      ),
    );
  }
}






class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('商品详情页'),
      ),
      body: new Center(
        child: new RaisedButton(
          textTheme: ButtonTextTheme.accent,
          color: Colors.white,
          child: Text('前往个人页面'),
          onPressed: (){
            Navigator.push(context,new  MaterialPageRoute(
              builder:(context) =>new ThirdScreen())
            );
          }
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('个人页面'),
      ),
      body: new Center(
        child: new RaisedButton(
          textTheme: ButtonTextTheme.accent,
          color: Colors.white,
          child: Text('返回首页'),
          onPressed: (){
            Navigator.push(context,new  MaterialPageRoute(
              builder:(context) =>new FirstScreen())
            );
          }
        ),
      ),
    );
  }
}
