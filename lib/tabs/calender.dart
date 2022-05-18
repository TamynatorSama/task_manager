import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task/logic/db_helper.dart';
import 'package:task/logic/task_model.dart';
import 'package:task/reuseable/today.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    
    Future<List<Task>> getTask() async {
      final taskList = await DatabaseProvider.db.getTasks();
      List<Task> todaysList = [];
      taskList.forEach((item) {
        if (item.begin.contains(DateFormat('d MMM').format(DateTime.now()))) {
          todaysList.add(item);
        }
      });
      return todaysList;
    }

    var cont = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: cont.height * 0.25,
              ),
              child: FutureBuilder(
                  future: getTask(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var usableList = snapshot.data as List;
                      if (usableList.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.only(top: cont.height * 0.2),
                          child: Center(
                              child: Text("You don't have any task today",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.6)))),
                        );
                      } else {
                        return Column(
                          children: List.generate(
                              usableList.length,
                              (index) => TodayCard(
                                // key: id,
                                    color: usableList[index].color,
                                    title: usableList[index].title,
                                    description: usableList[index].description,
                                    timeRange: usableList[index].begin +
                                        " - " +
                                        usableList[index].end,
                                    delete: () {
                                      DatabaseProvider.db
                                          .delete(usableList[index].id);
                                          setState(() {
                                            
                                          });
                                    },
                                  )),
                        );
                      }
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          (Center(
                              child: Text("You don't have any task today"))),
                        ],
                      );
                    }
                  }),
            ),
          ),
        ),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4,
              sigmaY: 4,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: double.maxFinite,
              height: cont.height * 0.25,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
              ),
              child: TableCalendar(
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.bold),
                  weekdayStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
                ),
                daysOfWeekHeight: cont.height * 0.02,
                focusedDay: DateTime.utc(DateTime.now().year,
                    DateTime.now().month, DateTime.now().day),
                firstDay: DateTime.utc(1972, 1, 1),
                lastDay: DateTime.utc(2430, 12, 31),
                calendarFormat: CalendarFormat.week,
                headerStyle: HeaderStyle(
                  headerMargin: const EdgeInsets.only(bottom: 10),
                  headerPadding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  leftChevronIcon: Icon(Icons.chevron_left,
                      color: Colors.black.withOpacity(0.7), size: 45),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.black.withOpacity(0.7),
                    size: 45,
                  ),
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                ),
                calendarStyle: CalendarStyle(
                    defaultTextStyle:
                        TextStyle(color: Colors.black.withOpacity(0.7)),
                    weekendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    todayTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7)),
                    todayDecoration: BoxDecoration(
                        color: const Color.fromRGBO(241, 175, 87, 1),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 6,
                              spreadRadius: 3,
                              offset: const Offset(0, 1))
                        ])),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}


// 1 camera
// 2 recorder
// 3 cable
// 4 storage
// 5 power
// 6 remote access app
// 7 connector / mediaconverter