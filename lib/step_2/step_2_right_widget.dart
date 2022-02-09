import 'package:flutter/material.dart';

import '../yinyang.dart';

class Step2RightWidget extends StatefulWidget {
  final AnimationController animationController;
  final double diameter;
  const Step2RightWidget({Key? key, required this.animationController, required this.diameter}) : super(key: key);

  @override
  _Step2RightWidgetState createState() => _Step2RightWidgetState();
}

class _Step2RightWidgetState extends State<Step2RightWidget> with TickerProviderStateMixin {
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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
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
                begin: RelativeRect.fromSize(Rect.fromLTWH(width - diameter - (diameter / 4), halfHeight, diameter, diameter), biggest),
                end: RelativeRect.fromSize(Rect.fromLTWH(halfWidth - (diameter / 2), halfHeight, diameter, diameter), biggest),
              ).animate(widget.animationController),
              child: YinYang(diameter: diameter * 2),
            ),
          ],
        );
      },
    );
  }
}
