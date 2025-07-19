import 'package:flutter/material.dart';

Route createFadeSlideRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 700),
    reverseTransitionDuration: Duration(milliseconds: 700),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final slide = Tween<Offset>(
        begin: Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      ));

      final fade = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(animation);

      return SlideTransition(
        position: slide,
        child: FadeTransition(
          opacity: fade,
          child: child,
        ),
      );
    },
  );
}
