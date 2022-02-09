import 'package:flutter/material.dart';

PageRouteBuilder<dynamic> pageTransition(BuildContext context, {required Widget page, Duration duration = const Duration(milliseconds: 250)}) {
  return PageRouteBuilder(
    maintainState: false,
    transitionDuration: duration,
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = const Offset(0.0, 0.0);
      var curve = Curves.easeInOut;

      // Slide Tween
      var offsetTween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
