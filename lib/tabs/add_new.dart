import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/logic/state_manager.dart';
import 'package:task/reuseable/label.dart';
import 'package:task/reuseable/levels.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Consumer<StateManager>(
            builder: (context, value, child) => Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Create Task",
                              style: TextStyle(
                                  color: Color.fromRGBO(32, 75, 90, 1),
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 2, top: 3),
                              width: 60,
                              height: 3,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Title",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(32, 75, 90, 1))),
                        style: const TextStyle(
                            color: Color.fromRGBO(32, 75, 90, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 15),
                              child: LabelText(text: "Levels")),
                          Row(
                            children: const [
                              Levels(color: Colors.red),
                              Levels(color: Colors.blue),
                              Levels(color: Colors.orange),
                              Levels(color: Colors.black),
                              Levels(color: Colors.grey)
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 40, bottom: 10),
                            child: LabelText(text: "Start"),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${value.begin.day}/${value.begin.month}/${value.begin.year}",
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin:
                                        const EdgeInsets.only(left: 2, top: 3),
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    height: 3,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin:
                                        const EdgeInsets.only(left: 2, top: 3),
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    height: 3,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              IconButton(
                                color: Colors.teal,
                                onPressed: () {
                                  value.beginDatePicker(context);
                                },
                                icon: const Icon(Icons.date_range),
                              ),
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
                                Text(
                                  "${value.start.hour}:${value.start.minute}",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                                IconButton(
                                    onPressed: () {
                                      value.startTimePicker(context);
                                    },
                                    icon: const Icon(
                                      Icons.timelapse,
                                      color: Color.fromRGBO(32, 75, 90, 1),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 40, bottom: 10),
                              child: LabelText(text: "Finish"),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "${value.end.day}/${value.end.month}/${value.end.year}",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(
                                          left: 2, top: 3),
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
                                      height: 3,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(
                                          left: 2, top: 3),
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
                                      height: 3,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                IconButton(
                                  color: Colors.teal,
                                  onPressed: () {
                                    value.endDatePicker(context);
                                  },
                                  icon: const Icon(Icons.date_range),
                                ),
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
                                Text(
                                  "${value.end.hour}:${value.end.minute}",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                                IconButton(
                                    onPressed: () {
                                      value.endTimePicker(context);
                                    },
                                    icon: const Icon(
                                      Icons.timelapse,
                                      color: Color.fromRGBO(32, 75, 90, 1),
                                    ))
                              ],
                            ),
                          ),
                          ],
                        ),
                      ),
                    ])));
  }
}
