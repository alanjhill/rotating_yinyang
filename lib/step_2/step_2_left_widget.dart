import 'package:flutter/material.dart';
import 'package:rotating_yinyang/yinyang.dart';

class Step2LeftWidget extends StatefulWidget {
  final AnimationController animationController;
  final double diameter;
  const Step2LeftWidget({Key? key, required this.animationController, required this.diameter}) : super(key: key);

  @override
  _Step2LeftWidgetState createState() => _Step2LeftWidgetState();
}

class _Step2LeftWidgetState extends State<Step2LeftWidget> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final width = constraints.maxWidth;
      final halfWidth = width / 2;
      final height = constraints.maxHeight;
      final halfHeight = height / 2;
      final diameter = ((halfWidth <= halfHeight) ? halfWidth : halfHeight) / 3;
      final Size biggest = constraints.biggest;
      return Stack(
        children: [
          PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromSize(Rect.fromLTWH(diameter / 4, halfHeight - diameter, diameter, diameter), biggest),
              end: RelativeRect.fromSize(Rect.fromLTWH(halfWidth - (diameter / 2), halfHeight - diameter, diameter, diameter), biggest),
            ).animate(widget.animationController),
            child: YinYang(diameter: diameter * 2),
          ),
        ],
      );
    });
  }
}
