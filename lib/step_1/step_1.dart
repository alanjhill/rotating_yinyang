import 'package:flutter/material.dart';
import 'package:rotating_yinyang/app_router.dart';
import 'package:rotating_yinyang/step_1/step_1_center_widget.dart';
import 'package:rotating_yinyang/step_1/step_1_left_widget.dart';
import 'package:rotating_yinyang/step_1/step_1_right_widget.dart';

class Step1 extends StatefulWidget {
  const Step1({Key? key}) : super(key: key);

  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> with TickerProviderStateMixin {
  late final AnimationController _centerAnimationController;
  late final AnimationController _leftAnimationController;
  late final AnimationController _rightAnimationController;
  bool _animating = false;

  @override
  void initState() {
    super.initState();
    _centerAnimationController = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _leftAnimationController = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _rightAnimationController = AnimationController(duration: const Duration(seconds: 2), vsync: this);

    _animate();
  }

  @override
  void dispose() {
    _centerAnimationController.dispose();
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
          body: Stack(children: [
            Step1CenterWidget(
              animationController: _centerAnimationController,
            ),
            Step1LeftWidget(
              animationController: _leftAnimationController,
            ),
            Step1RightWidget(
              animationController: _rightAnimationController,
            ),
          ]),
        ),
      ),
    );
  }

  void _onTap() {
    Navigator.pushNamed(context, AppRoutes.step2);
  }

  void _onDoubleTap() {
    if (!_animating) {
      _centerAnimationController.reset();
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
      _centerAnimationController.forward().whenComplete(() {
        _leftAnimationController.forward().whenComplete(() {
          _rightAnimationController.forward().whenComplete(() {
            setState(() {
              _animating = false;
            });
          });
        });
      });
    });
  }
}
