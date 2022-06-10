import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task/logic/db_helper.dart';
import 'package:task/logic/state_manager.dart';
import 'package:task/logic/task_model.dart';
import 'package:task/reuseable/label.dart';
import 'package:task/reuseable/levels.dart';

class AddTask extends StatefulWidget {
  AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var current = Provider.of<StateManager>(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.topRight,
        padding:
            const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
        // width: double.infinity,
        // height: double.infinity,
        color: const Color.fromARGB(160, 255, 255, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //Create a task: heading and its underline
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.06,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Create Task",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xff204B5A)),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            "assets/images/cancel.png",
                            scale: 3,
                            fit: BoxFit.contain,
                          ))
                    ],
                  ),
                  Container(
                    color: const Color.fromRGBO(241, 175, 87, 1),
                    height: 3,
                    width: 55,
                  )
                ],
              ),
            ),

            //Title and its input space

            SizedBox(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                    // Container(
                    //     padding: const EdgeInsets.only(top: 20, bottom: 9),
                    //     alignment: Alignment.topLeft,
                    //     child: const LabelText(text: "Title")),
                    TextFormField(
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          letterSpacing: 2),
                      controller: _titleController,
                      decoration: InputDecoration(
                        label: Text("Input Title", style: TextStyle(color: Color.fromARGB(108, 0, 0, 0)),),
                        errorStyle: TextStyle(color: Colors.red.withOpacity(0.7)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                                bottom: Radius.circular(12)),
                            borderSide:
                                BorderSide(color: Colors.red.withOpacity(0.7))),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12),
                                bottom: Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12),
                                bottom: Radius.circular(12)),
                            borderSide: BorderSide(width: 1, color: Colors.grey)),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "please enter Title";
                        } else {
                          return null;
                        }
                      },
                    )
                  ]),
                ),
              ),
            ),

            //Levels
            Container(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Level Text
                  Container(
                      padding: const EdgeInsets.only(bottom: 13),
                      alignment: Alignment.topLeft,
                      child: const LabelText(text: "Levels")),
                  //Levels Body
                  Wrap(
                    children: [
                      Levels(
                          color: "ACACAC",
                          level: "Default",
                          function: () {
                            current.selectColor("FFFFFF");
                          }),
                      Levels(
                          color: "ACACAC",
                          level: "Level 1",
                          function: () {
                            current.selectColor("ACACAC");
                          }),
                      Levels(
                          color: "D4F5C5",
                          level: "Level 2",
                          function: () {
                            current.selectColor("D4F5C5");
                          }),
                      Levels(
                          color: "C5E4F5",
                          level: "Level 3",
                          function: () {
                            current.selectColor("C5E4F5");
                          }),
                      Levels(
                          color: "F5C5C5",
                          level: "Level 4",
                          function: () {
                            current.selectColor("F5C5C5");
                          })
                    ],
                  )
                ],
              ),
            ),
            //Start and Finish
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  //Start
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 19),
                        child: const LabelText(text: "Start"),
                      ),
                      GestureDetector(
                        onTap: () {
                          current.beginDatePicker(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.12,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border(
                                top: BorderSide(width: 1, color: Colors.green),
                                left: BorderSide(width: 1, color: Colors.green),
                                right:
                                    BorderSide(width: 1, color: Colors.green),
                                bottom:
                                    BorderSide(width: 1, color: Colors.green),
                              )),
                          child: Text(
                              "${DateFormat('EEE, d MMM').format(current.begin)}  ${current.start.format(context)}"),
                        ),
                      )
                    ],
                  ),
                  //Space Between
                  const SizedBox(
                    width: 15,
                  ),
                  //Finish
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 19),
                        child: const LabelText(text: "Finish"),
                      ),
                      GestureDetector(
                        onTap: () {
                          current.endDatePicker(context);
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: MediaQuery.of(context).size.width * 0.12,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border(
                                  top:
                                      BorderSide(width: 1, color: Colors.green),
                                  left:
                                      BorderSide(width: 1, color: Colors.green),
                                  right:
                                      BorderSide(width: 1, color: Colors.green),
                                  bottom:
                                      BorderSide(width: 1, color: Colors.green),
                                )),
                            child: Text(
                              "${DateFormat('EEE, d MMM').format(current.end)}  ${current.endTime.format(context)}",
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
            //Description
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Description Text
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: LabelText(text: "Description"),
                  ),
                  //Textfield
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xff204B5A), width: 1.2)),
                    child: TextField(
                      controller: _descriptionController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                          hintText: "Add Something ...",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                          border: InputBorder.none),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5),
                    ),
                  )
                ],
              ),
            ),
            //Add Button
            GestureDetector(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  Task newTask = Task(
                    title: _titleController.text,
                    begin: DateFormat('d MMM, h:mm a').format(current.begin),
                    end: DateFormat('d MMM, h:mm a').format(current.end),
                    description: _descriptionController.text,
                    color: current.selectedColor,
                  );
                  DatabaseProvider.db.addNewTask(newTask);
                  Navigator.pop(context);
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 52,
                width: 150,
                decoration: const BoxDecoration(
                    color: Color(0xff204B5A),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const Text(
                  "Add Task",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
