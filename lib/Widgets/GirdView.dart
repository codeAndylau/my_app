import 'package:flutter/material.dart';

class GirdViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      padding: EdgeInsets.all(5),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: _buildGridTitleList(50),
    );
  }

  List<Container> _buildGridTitleList(int count) {
    return List.generate(
        count,
        (index) => Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 10, color: Colors.black38), // 边框
                  borderRadius: BorderRadius.all(Radius.circular(8)) // 圆角
                  ),
              margin: EdgeInsets.all(5),
              child: Stack(
                children: [
                  ClipRRect(
                    // 图片也切一个圆角
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/row_girl.jpeg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    "flag-${index}",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ));
  }

  Widget _buildStack() => Stack(
        alignment: Alignment(0.6, 0.6),
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/row_girl.jpeg"),
            radius: 100,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black45),
            child: Text(
              "Mia B",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      );
}
