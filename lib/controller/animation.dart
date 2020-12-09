import 'package:flutter/material.dart';

class SliderRight extends PageRouteBuilder {
  final page;
  SliderRight({this.page})
      : super(
            pageBuilder: (context, animation, animationtwo) => page,
            transitionsBuilder: (context, animation, animationone, child) {
              return Align(
                child: SizeTransition(
                  sizeFactor: animation,
                  child: child,
                ),
              );
            });
}
