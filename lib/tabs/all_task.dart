import 'package:flutter/material.dart';
import 'package:task/logic/db_helper.dart';
import 'package:task/logic/task_model.dart';
import 'package:task/reuseable/all_task_card.dart';

class AllTask extends StatelessWidget {
  const AllTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Task>> getTask() async {
      final taskList = await DatabaseProvider.db.getTasks();
      return taskList;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Text(
              "Tasks",
              style: TextStyle(
                  color: Color.fromRGBO(32, 75, 90, 1),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder(
              future: getTask(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data == null) {
                  return const Center(
                    child: Text("you do not have any task scheduled"),
                  );
                } else {
                  var list = snapshot.data as List;
                  if (list.isEmpty) {
                    return const Center(
                      child: Text("you do not have any task scheduled"),
                    );
                  }
                  return Expanded(
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return AllTaskCard(
                              title: list[index].title,
                              timeRange:
                                  list[index].begin + " - " + list[index].end,
                              color: list[index].color,
                              description: list[index].description,
                              delete: () {
                                DatabaseProvider.db.delete(list[index].id);
                              },
                            );
                          }));
                }
              }),
        ],
      ),
    );
  }
}
