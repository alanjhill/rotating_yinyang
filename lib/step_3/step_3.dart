import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_router.dart';
import '../yinyang.dart';

class Step3 extends StatefulWidget {
  const Step3({Key? key}) : super(key: key);

  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> with SingleTickerProviderStateMixin {
  late final AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(duration: const Duration(seconds: 10), vsync: this);
    rotationController.repeat();
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: _onTap,
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;
            final diameter = ((width <= height) ? width : height) / 3;
            return GestureDetector(
              onTap: _onTap,
              child: Center(
                child: SizedBox(
                  width: diameter,
                  height: diameter,
                  child: RotationTransition(
                    turns: Tween(begin: 1.0, end: 0.0).animate(rotationController),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: diameter,
                            height: diameter,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.black, Colors.black, Colors.white],
                                stops: [0, 0.5, 0.5],
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 9,
                                  offset: const Offset(4, 4), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: YinYang(diameter: diameter, animate: true),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: YinYang(diameter: diameter, animate: true),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _onTap() {
    Navigator.pushNamed(context, 'step-1');
  }
}
