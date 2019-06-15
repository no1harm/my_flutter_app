// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new HomePage()
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('选择商品'),),
      body: new ProductList(
        productList: new List<Product>.generate(10, (i)=>Product('商品 $i','这是一个商品详情，编号为:$i')),
      )
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title:Text('首页')),
      body: new Center(
        child: RouteButton(),
      ),
    );
  }
}

class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed:(){
          _navigateToProductList(context);
      },
      child: Text('选择商品'),
    );
  }
  _navigateToProductList(BuildContext context) async{  // 异步函数
    final result = await Navigator.push(//等待
      context, 
      MaterialPageRoute(builder: (context)=> FirstScreen())
    );
    Scaffold.of(context).showSnackBar(SnackBar(content:Text('$result')));
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
      body: new ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context,index){
          return ListTile(
            leading: new Icon(Icons.shop),
            title:Text(productList[index].title),
            subtitle: Text(productList[index].description),
            onTap: (){
              Navigator.pop(context,'${productList[index].title}');
            },
          );
        },
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('${product.title}'),),
      body: Center(
        child: Text('${product.description}'),
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
