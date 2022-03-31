import 'package:flutter/material.dart';

class Back extends StatelessWidget {
  final Widget child;

  const Back({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 4,
                blurStyle: BlurStyle.outer)
          ]),
      child: FittedBox(alignment: Alignment.center, child: child),
    );
  }
}
