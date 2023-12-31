import 'dart:ui';

import 'package:flutter/material.dart';

class HomeBackgroundWidget extends StatelessWidget {
  const HomeBackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(3,-0.3),
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purpleAccent,
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-1.9,-0.2),
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purpleAccent,
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0,-1.8),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0,2),
          child: Container(
            height: 325,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
        ),
        BackdropFilter(filter:ImageFilter.blur(sigmaX: 100,sigmaY: 100),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ),

      ],
    );
  }
}
