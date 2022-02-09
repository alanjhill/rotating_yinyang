import 'package:flutter/material.dart';

class Step1RightWidget extends StatefulWidget {
  final AnimationController animationController;
  const Step1RightWidget({Key? key, required this.animationController}) : super(key: key);

  @override
  _Step1RightWidgetState createState() => _Step1RightWidgetState();
}

class _Step1RightWidgetState extends State<Step1RightWidget> with TickerProviderStateMixin {
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
              child: AnimatedBuilder(
                animation: widget.animationController,
                builder: (context, child) {
                  final innerDiameter = diameter - 10;
                  final outerBorderRadius = (diameter / 2) * widget.animationController.value + 10;
                  final innerBorderRadius = (innerDiameter / 2) * widget.animationController.value + 8;
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: diameter,
                        height: diameter,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(outerBorderRadius),
                        ),
                      ),
                      Container(
                        width: innerDiameter - (widget.animationController.value * innerDiameter) + 16,
                        height: innerDiameter - (widget.animationController.value * innerDiameter) + 16,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(innerBorderRadius),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
