import 'package:flutter/material.dart';
import 'package:task/reuseable/label.dart';

class DateTimePick extends StatelessWidget {
  final String text;
  final String dateandtime;
  final Future picker;
  const DateTimePick(
      {Key? key,
      required this.text,
      required this.dateandtime,
      required this.picker})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(text: text),
          GestureDetector(
            onTap: () {
              picker;
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Text(
                dateandtime,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.6)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
