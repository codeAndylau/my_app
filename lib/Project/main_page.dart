import 'package:flutter/material.dart';
import './home_page.dart';
import './discover_page.dart';
import './category_page.dart';
import './cart_page.dart';
import './mine_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
    BottomNavigationBarItem(icon: Icon(Icons.looks), label: '发现'),
    BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: '购物车'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的')
  ];

  final pageList = [
    HomePage(),
    CategoryPage(),
    DiscoverPage(),
    CartPage(),
    MinePage()
  ];

  var currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = pageList[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('巴扎商城'),
      ),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        selectedLabelStyle: TextStyle(color: Colors.blue),
        currentIndex: currentIndex,
        items: items,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = pageList[index];
          });
        },
      ),
    );
  }
}
