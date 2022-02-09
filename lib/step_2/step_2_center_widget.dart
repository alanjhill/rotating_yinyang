import 'package:flutter/material.dart';

class Step2CenterWidget extends StatefulWidget {
  const Step2CenterWidget({Key? key}) : super(key: key);

  @override
  _Step2CenterWidgetState createState() => _Step2CenterWidgetState();
}

class _Step2CenterWidgetState extends State<Step2CenterWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final width = constraints.maxWidth;
      final height = constraints.maxHeight;
      final diameter = ((width <= height) ? width : height) / 3;
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
                borderRadius: BorderRadius.circular(diameter),
              ),
            ),
          ),
        ],
      );
    });
  }
}
