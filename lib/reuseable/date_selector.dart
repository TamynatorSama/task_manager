/* am keeping this foile incase i want torevert back to the former time and date picker*/


import 'package:flutter/material.dart';
import 'package:task/reuseable/back.dart';
import 'package:task/reuseable/label.dart';

class DateTimeSelector extends StatelessWidget {
  const DateTimeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30, bottom: 5),
          child: LabelText(text: "Start"),
        ),
        Row(
          children: [
            Column(
              children: [
                const Text(
                  "year",
                  // "${value.begin.day}/${value.begin.month}/${value.begin.year}",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 2, top: 3),
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: 3,
                  color: Colors.grey,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 2, top: 3),
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: 3,
                  color: Colors.grey,
                ),
              ],
            ),
            Back(
              child: IconButton(
                color: Colors.orange,
                onPressed: () {
                  // value.beginDatePicker(context);
                },
                icon: const Icon(Icons.date_range),
              ),
            )
          ],
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width * 0.35,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromRGBO(32, 75, 90, 1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "time",
                // "${value.start.hour}:${value.start.minute}",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              IconButton(
                  onPressed: () {
                    // value.startTimePicker(context);
                  },
                  icon: const Icon(
                    Icons.timelapse,
                    color: Color.fromRGBO(32, 75, 90, 1),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
