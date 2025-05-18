import 'package:flutter/material.dart';
import '../data/data.dart';

class CircleContaniner extends StatelessWidget {
  const CircleContaniner({super.key, required this.color, this.child});

  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          width: 2.5,
          color: color,
        ),
      ),
      child: Center(
        child: child
      ),
    );
  }
}
