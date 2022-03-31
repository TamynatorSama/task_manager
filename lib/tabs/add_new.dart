import 'package:flutter/material.dart';
import 'package:task/logic/db_helper.dart';
import 'package:task/logic/task_model.dart';
// import 'package:provider/provider.dart';
// import 'package:task/logic/state_manager.dart';
// import 'package:task/reuseable/label.dart';
// import 'package:task/reuseable/levels.dart';
// import 'package:task/reuseable/new_datepicker.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    addTask(Task newTask) {
      DatabaseProvider.db.addNewTask(newTask);
    }

    deleteTask(int id) {
      DatabaseProvider.db.delete(id);
    }
    // TextEditingController _titleController = TextEditingController();
    // String color = Provider.of<StateManager>(context).selectedColor;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Task latest = Task(
                    title: "llo",
                    begin: "${TimeOfDay.now()}",
                    end: "${TimeOfDay.now()}",
                    description:
                        "this is the tesing phase of the task manager local database",
                    color: "fe33ea");
                addTask(latest);
              },
              child: const Text("save task")),
          // ElevatedButton(
          //     onPressed: () {
          //       // for (int i = 25; i < 28; i++) {
          //         deleteTask(2);
          //       // }
          //     },
          //     child: Text("delete"))
        ],
      ),
    );
  }
}
