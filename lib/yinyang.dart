import 'package:flutter/material.dart';
import 'package:rotating_yinyang/yin-or-yang.dart';

class YinYang extends StatefulWidget {
  final double diameter;
  final bool animate;
  const YinYang({Key? key, required this.diameter, this.animate = false}) : super(key: key);

  @override
  _YinYangState createState() => _YinYangState();
}

class _YinYangState extends State<YinYang> with SingleTickerProviderStateMixin {
  late final AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(duration: const Duration(seconds: 4), vsync: this);
    if (widget.animate) {
      rotationController.repeat();
    }
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final diameter = widget.diameter / 2;
    final thisSize = Size(diameter, diameter);
    return SizedBox(
      width: thisSize.width,
      height: thisSize.height,
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black, Colors.black, Colors.white],
                  stops: [0, 0.5, 0.5],
                ),
                shape: BoxShape.circle,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: YinOrYang(type: YinOrYangType.yin, size: thisSize),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: YinOrYang(type: YinOrYangType.yang, size: thisSize),
            ),
          ],
        ),
      ),
    );
  }
}
