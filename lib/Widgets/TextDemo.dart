import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        '第一个text文本',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
