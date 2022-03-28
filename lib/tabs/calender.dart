import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatelessWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.43,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(32, 75, 90, 1),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TableCalendar(
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekendStyle: TextStyle(
                      color: Colors.white,
                    ),
                    weekdayStyle: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  daysOfWeekHeight: MediaQuery.of(context).size.height * 0.08,
              focusedDay: DateTime.utc(DateTime.now().year,DateTime.now().month,DateTime.now().day),
              firstDay: DateTime.utc(1972,1,1),
              lastDay: DateTime.utc(2430,12,31),
              calendarFormat: CalendarFormat.week,
              headerStyle: const HeaderStyle(
                leftChevronIcon: Icon(Icons.chevron_left,color: Colors.white,size: 35),
                rightChevronIcon: Icon(Icons.chevron_right,color: Colors.white,size: 35,),
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18
                ),
              ),
              calendarStyle: CalendarStyle(
                defaultTextStyle: const TextStyle(
                  color: Colors.white
                ),
                weekendTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                todayTextStyle: const TextStyle(
                  fontWeight:FontWeight.bold,
                  color: Colors.white70
                ),
                todayDecoration: BoxDecoration(
                  color: const Color.fromRGBO(241, 175, 87, 1),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6,
                      spreadRadius: 3,
                      offset: const Offset(0, 1)
                    )
                  ]
                )
              ),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(241, 175, 87, 1), 
                    borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text("Set Remainder",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
                ),
              )
                  ],
                )
              ),
            ]
            ),
        ),
      ),
    );
  }
}