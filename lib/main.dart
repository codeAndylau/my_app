import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:english_words/english_words.dart';

import 'Widgets/ContainerDemo.dart';
import 'Widgets/RowAndColumn.dart';
import 'Widgets/GirdView.dart';
import 'Widgets/FavoriteWidget.dart';

void main() {
  debugPaintSizeEnabled = false; // 开启界面绘制边界线
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 顶部文本
  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  // 标题行内容
  Widget titleSection = Container(
    padding: EdgeInsets.all(20), // 自身的内边距，子widget的外边距离
    child: Row(
      children: [
        Expanded(
          // 拉伸填充控件
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        FavoriteWidget(),
      ],
    ),
  );

  // 按钮行
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Layout Demo')),
        body: ListView(
          children: [
            Image.asset(
              "assets/images/row_girl.jpeg",
              width: 600,
              height: 240,
              fit: BoxFit.cover, // 告诉系统图片应当尽可能等比缩小到刚好能够覆盖住整个渲染 box
            ),
            textSection,
            titleSection,
            buttonSection
          ],
        ),
      ),
      debugShowCheckedModeBanner: true, // 是否显示右上角的bug图标
      showSemanticsDebugger: false, // 是否开启图片渲染
    );
  }
}

// 获取一个随机的单词
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          /*1*/
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

/*
熟记这条布局规则：
首先，上层 widget 向下层 widget 传递约束条件；
然后，下层 widget 向上层 widget 传递大小信息。
最后，上层 widget 决定下层 widget 的位置。
*/
