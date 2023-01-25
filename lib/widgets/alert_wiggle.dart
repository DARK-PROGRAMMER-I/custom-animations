import 'dart:math';

import 'package:flutter/material.dart';

class AlertWiggle extends StatelessWidget {
  final Widget child;
  static final signValue = 2 * pi;
  final double endValue= 0;
  const AlertWiggle({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 200),
      child: child,
      builder: (_,double value, child1){
        return child1!;
      },
    );
  }
}
