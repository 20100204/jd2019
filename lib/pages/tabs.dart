import 'package:flutter/material.dart';
import './tabs/home.dart';
import './tabs/category.dart';
import './tabs/shopcart.dart';
import './tabs/member.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _curIndex = 0;
  List<Widget> _list = [
    HomePage(),
    CategoryPage(),
    ShopcartPage(),
    MemberPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: this._list[this._curIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this._curIndex,
        onTap: (index) {
          setState(() {
            this._curIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("分类")),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), title: Text("购物车")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("我的")),
        ],
      ),
    );
  }
}
