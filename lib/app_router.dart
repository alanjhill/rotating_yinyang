import 'package:flutter/material.dart';
import 'package:rotating_yinyang/page_transition.dart';
import 'package:rotating_yinyang/step_1/step_1.dart';
import 'package:rotating_yinyang/step_2/step_2.dart';
import 'package:rotating_yinyang/step_3/step_3.dart';

class AppRoutes {
  static const step1 = 'step-1';
  static const step2 = 'step-2';
  static const step3 = 'step-3';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(BuildContext context, RouteSettings settings) {
    final args = settings.arguments;
    debugPrint('args: $args');
    switch (settings.name) {
      case AppRoutes.step1:
        return pageTransition(
          context,
          page: const Step1(),
        );
      case AppRoutes.step2:
        return pageTransition(
          context,
          page: const Step2(),
        );
      case AppRoutes.step3:
        return pageTransition(
          context,
          page: const Step3(),
        );
    }
  }
}
