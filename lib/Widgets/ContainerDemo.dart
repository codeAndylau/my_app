import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200]), // 背景颜色
      child: Column(
        // 一列显示两排
        children: [
          _buildImageRow(), // 一排两个图片
          _buildImageRow()
        ],
      ),
    );
  }

  // 一行显示两个image
  Widget _buildImageRow() {
    return Row(
      children: [_buildDecoratedImage(), _buildDecoratedImage()],
    );
  }

  // 对每个image进行装饰一下
  Widget _buildDecoratedImage() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 10, color: Colors.black38), // 边框
            borderRadius: BorderRadius.all(Radius.circular(8)) // 圆角
            ),
        margin: EdgeInsets.all(5),
        child: ClipRRect(
          // 图片也切一个圆角
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            "assets/images/row_girl.jpeg",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
