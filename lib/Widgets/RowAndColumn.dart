import 'package:flutter/material.dart';

class RowAndColumnDemo extends StatelessWidget {
  // 左边一列的内容
  final leftColumn = Container(
    padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
    child: Column(
      children: [
        Text("五星好评主标题"),
        Text("五星好评子标题"),
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.green[500]),
                  Icon(Icons.star, color: Colors.green[500]),
                  Icon(Icons.star, color: Colors.green[500]),
                  Icon(Icons.star, color: Colors.black),
                  Icon(Icons.star, color: Colors.black),
                ],
              ),
              Text(
                "170*",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: 20),
              )
            ],
          ),
        ),
        DefaultTextStyle.merge(
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 15,
            height: 2,
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.kitchen, color: Colors.green[500]),
                    Text('PREP:'),
                    Text('25 min'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.timer, color: Colors.green[500]),
                    Text('COOK:'),
                    Text('1 hr'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.restaurant, color: Colors.green[500]),
                    Text('FEEDS:'),
                    Text('4-6'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
        height: 500,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 500,
                child: leftColumn,
              ),
              Spacer(),
              Container(
                width: 100,
                height: 500,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/row_girl.jpeg",
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
