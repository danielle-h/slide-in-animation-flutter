import 'package:flutter/material.dart';

class AnimatedTile extends StatelessWidget {
  const AnimatedTile({
    super.key,
    required this.animationController,
    required this.animation,
    required this.slide,
    required this.child,
  });

  final AnimationController animationController;
  final Animation<double> animation;
  final int slide;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.translationValues(
                0, (1.0 - animation.value) * slide, 0),
            child: Padding(padding: const EdgeInsets.all(8.0), child: child),
          );
        });
  }
}
