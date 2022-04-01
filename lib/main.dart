import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/logic/state_manager.dart';
import 'package:task/tabs/add_new.dart';
import 'package:task/tabs/all_task.dart';
import 'package:task/tabs/calender.dart';
import 'package:task/tabs/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<StateManager>(
        create: (_) => StateManager(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List icons = [
    Icons.format_align_right,
    Icons.calendar_view_day_rounded,
    Icons.add,
    Icons.analytics,
    Icons.person
  ];
  final tab = [
    const Home(),
    const Calender(),
    const AddTask(),
    const AllTask(),
    const Center(
      child: Text(
        "User",
        style: TextStyle(fontSize: 50),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tab[Provider.of<StateManager>(context).selectedindex],
        bottomNavigationBar: Row(
          children: List.generate(
              icons.length,
              (index) => Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: bottomItems(icons[index], index, context),
                  ))),
        ));
  }
//bottom navigation item and also takes care of the click event and ui changes
  Widget bottomItems(IconData display, plus, context) {
    return GestureDetector(
      onTap: () {
        Provider.of<StateManager>(context,listen: false).changeIndex(plus);
      },
      child: Container(
        height: plus == 2 ? 70 : 50,
        child: Icon(
          display,
          color: plus == 2
              ? Colors.white
              : plus == Provider.of<StateManager>(context,listen: false).selectedindex
                  ? const Color.fromRGBO(32, 75, 90, 1)
                  : Colors.grey,
        ),
        decoration: plus == 2
            ? const BoxDecoration(
                color: Color.fromRGBO(241, 175, 87, 1),
                shape: BoxShape.circle,
              )
            : const BoxDecoration(
                color: null,
              ),
      ),
    );
  }
}
