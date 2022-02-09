import 'package:flutter/material.dart';

enum YinOrYangType { yin, yang }

class YinOrYang extends StatelessWidget {
  final Size size;
  final YinOrYangType type;
  const YinOrYang({Key? key, required this.size, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = size.width / 2;
    final height = width;
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: type == YinOrYangType.yin ? Colors.black : Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: width / 4,
              height: height / 4,
              decoration: BoxDecoration(
                color: type == YinOrYangType.yang ? Colors.black : Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
