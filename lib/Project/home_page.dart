import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController tfController = TextEditingController();
  var currentText = '美好人间是多么美好的精致服务';

  @override
  Widget build(BuildContext context) {
    getHttp();
    return Container(
      child: Column(
        children: [
          TextField(
            controller: tfController,
            decoration: InputDecoration(
              labelText: '美好人间',
              helperText: '请输入你的关键字',
              contentPadding: EdgeInsets.all(10),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  currentText = _fetchSearchData();
                });
              },
              child: Text('搜索你的美女数据')),
          Text(currentText)
        ],
      ),
    );
  }

  String _fetchSearchData() {
    if (tfController.text.isEmpty) {
      return '输入内容为空';
    } else {
      return WordPair.random().asPascalCase;
    }
  }

  Future getHttp() async {
    try {
      Response response;
      response = await Dio().get(
          "http://test.bazirim.life/mobile_app/index.php?bz_ctr=article&op=article_list&ac_id=2");
      return response.data;
    } catch (e) {
      return e;
    }
  }
}
