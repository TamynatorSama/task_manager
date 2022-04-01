import 'package:flutter/material.dart';
import 'package:task/logic/change_to_hex.dart';

class Levels extends StatelessWidget {
  final String color;
  final String level;
  final VoidCallback function;
  const Levels({Key? key, required this.color, required this.level, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.only(right: 10,bottom: 10),
        child: Container(
          alignment: Alignment.center,
          height: 45,
          width: 95,
          decoration: level == "Default"
              ? const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border(
                    top: BorderSide(
                        width: 1, color: Color.fromRGBO(32, 75, 90, 1)),
                    left: BorderSide(
                        width: 1, color: Color.fromRGBO(32, 75, 90, 1)),
                    right: BorderSide(
                        width: 1, color: Color.fromRGBO(32, 75, 90, 1)),
                    bottom: BorderSide(
                        width: 1, color: Color.fromRGBO(32, 75, 90, 1)),
                  ))
              : BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: HexColor(color),
                ),
          child: Text(
            level,
            style: TextStyle(
                fontSize: 19,
                color: level == "Default"
                    ? const Color.fromRGBO(32, 75, 90, 1)
                    : Colors.black.withOpacity(0.8)),
          ),
        ),
      ),
    );
  }
}
