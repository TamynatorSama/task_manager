
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/logic/state_manager.dart';

class AddTask extends StatelessWidget {
  const AddTask({ Key? key }) : super(key: key);

  @override

  Widget build(BuildContext context) {


  var current = Provider.of<StateManager>(context);
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topRight,
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        // width: double.infinity,
        // height: double.infinity,
        color: const Color.fromARGB(160, 255, 255, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //Create a task: heading and its underline
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create a Task",
                    style: TextStyle(
                        fontSize: 25, color: Color.fromARGB(159, 17, 11, 97)),
                  ),
                  Container(
                    color: const Color.fromRGBO(241, 175, 87, 1),
                    height: 1,
                    width: 55,
                  )
                ],
              ),
            ),

            //Title and its input space
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(top: 9, bottom: 9),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Title",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const TextField(
                  // controller: _titleController,
                  decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                        bottom: Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                        bottom: Radius.circular(12)),
                    borderSide: BorderSide(width: 3, color: Colors.black)),
                  ),
                )
              ]),
            ),

            //Levels
            Container(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  //Level Text
                  Container(
                      padding: const EdgeInsets.only(bottom: 13),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Levels",
                        style: TextStyle(fontSize: 24),
                      )),
                  //Levels Body
                  Column(
                    children: [
                      //Default
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(11),
                            child: InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                height: 45,
                                width: 95,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    border: Border(
                                      top: BorderSide(
                                          width: 1, color: Colors.green),
                                      left: BorderSide(
                                          width: 1, color: Colors.green),
                                      right: BorderSide(
                                          width: 1, color: Colors.green),
                                      bottom: BorderSide(
                                          width: 1, color: Colors.green),
                                    )),
                                child: const Text(
                                  "Default",
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.green),
                                ),
                              ),
                            ),
                          ),
                          //Level 1
                          Container(
                            padding: const EdgeInsets.only(right: 12),
                            child: InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                height: 45,
                                width: 95,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Colors.grey),
                                child: const Text(
                                  "Level 1",
                                  style: TextStyle(fontSize: 19),
                                ),
                              ),
                            ),
                          ),
                          //Level 2
                          InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: 95,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: Color.fromARGB(255, 220, 250, 217)),
                              child: const Text(
                                "Level 2",
                                style: TextStyle(fontSize: 19),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Level 3
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            child: InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                height: 45,
                                width: 95,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Color.fromARGB(255, 174, 245, 239)),
                                child: const Text(
                                  "Level 3",
                                  style: TextStyle(fontSize: 19),
                                ),
                              ),
                            ),
                          ),
                          //Level 4
                          InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: 95,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: Color.fromARGB(255, 238, 186, 186)),
                              child: const Text(
                                "Level 4",
                                style: TextStyle(fontSize: 19),
                              ),
                            ),
                          ),
                        ],
                      )
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
                        child: const Text("Start", style: TextStyle(fontSize: 24),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width*0.42,
                        height: MediaQuery.of(context).size.width*0.14,
                       decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    border: Border(
                                      top: BorderSide(
                                          width: 1, color: Colors.green),
                                      left: BorderSide(
                                          width: 1, color: Colors.green),
                                      right: BorderSide(
                                          width: 1, color: Colors.green),
                                      bottom: BorderSide(
                                          width: 1, color: Colors.green),
                                    )),
                        child: Text(current.calc1()),
                      )
                    ],
                  ),
                  //Space Between
                  const SizedBox(width: 15,),
                  //Finish
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 19),
                        child: const Text("Finish", style: TextStyle(fontSize: 24),),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width*0.42,
                        height: MediaQuery.of(context).size.width*0.14,
                       decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    border: Border(
                                      top: BorderSide(
                                          width: 1, color: Colors.green),
                                      left: BorderSide(
                                          width: 1, color: Colors.green),
                                      right: BorderSide(
                                          width: 1, color: Colors.green),
                                      bottom: BorderSide(
                                          width: 1, color: Colors.green),
                                    )),
                        child: Text(current.calc1()),
                      )
                    ],
                  )
                ],
              ),
            ),
            //Description
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Description Text
                  Container(child: const Text("Description", style: TextStyle(fontSize: 24),),padding: EdgeInsets.only(bottom: 12)),
                  //Textfield
                  const TextField(
                    style: TextStyle(
                      height: 6
                    ),
                  // controller: _titleController,
                  decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                        bottom: Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                        bottom: Radius.circular(12)),
                    borderSide: BorderSide(width: 3, color: Colors.black)),
                  ),
                ),
                ],
              ),
            ),
            //Add Button
            Container(
              alignment: Alignment.center,
              height: 52,
              width: 105,
              decoration: BoxDecoration(
              color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              child: Text("Add Task"),
            )
          ],
        ),
      ),
    );

  }
}