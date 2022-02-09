import 'package:flutter/material.dart';

class Step1CenterWidget extends StatefulWidget {
  final AnimationController animationController;
  const Step1CenterWidget({Key? key, required this.animationController}) : super(key: key);

  @override
  _Step1CenterWidgetState createState() => _Step1CenterWidgetState();
}

class _Step1CenterWidgetState extends State<Step1CenterWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final width = constraints.maxWidth;
      final height = constraints.maxHeight;
      final diameter = ((width <= height) ? width : height) / 3;
      return AnimatedBuilder(
          animation: widget.animationController,
          builder: (context, child) {
            return Stack(
              children: [
                Positioned(
                  left: (width / 2) - (diameter / 2),
                  top: (height / 2) - (diameter / 2),
                  child: Container(
                    width: diameter,
                    height: diameter,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.black, Colors.black, Colors.white],
                        stops: [0, 0.5, 0.5],
                      ),
                      borderRadius: BorderRadius.circular(widget.animationController.value * diameter),
                    ),
                  ),
                ),
              ],
            );
          });
    });
  }
}
