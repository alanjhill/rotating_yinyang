import 'package:flutter/material.dart';
import 'package:rotating_yinyang/app_router.dart';
import 'package:rotating_yinyang/step_2/step_2_center_widget.dart';
import 'package:rotating_yinyang/step_2/step_2_left_widget.dart';
import 'package:rotating_yinyang/step_2/step_2_right_widget.dart';

class Step2 extends StatefulWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> with TickerProviderStateMixin {
  late final AnimationController _leftAnimationController;
  late final AnimationController _rightAnimationController;
  bool _animating = false;

  @override
  void initState() {
    super.initState();
    _leftAnimationController = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _rightAnimationController = AnimationController(duration: const Duration(seconds: 2), vsync: this);

    _animate();
  }

  @override
  void dispose() {
    _leftAnimationController.dispose();
    _rightAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: _onTap,
        onDoubleTap: _onDoubleTap,
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Center(
            child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;
              final diameter = ((width <= height) ? width : height) / 3;
              return Center(
                child: Container(
                  color: Colors.grey[300],
                  child: Stack(children: [
                    const Step2CenterWidget(),
                    Step2LeftWidget(
                      diameter: diameter,
                      animationController: _leftAnimationController,
                    ),
                    Step2RightWidget(
                      diameter: diameter,
                      animationController: _rightAnimationController,
                    ),
                  ]),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    Navigator.pushNamed(context, AppRoutes.step3);
  }

  void _onDoubleTap() {
    if (!_animating) {
      _leftAnimationController.reset();
      _rightAnimationController.reset();
      _animate();
    }
  }

  void _animate() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _animating = true;
      });
      _leftAnimationController.forward().whenComplete(() {
        _rightAnimationController.forward().whenComplete(() {
          setState(() {
            _animating = false;
          });
        });
      });
    });
  }
}
