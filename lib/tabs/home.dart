import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/logic/state_manager.dart';
import 'package:task/reuseable/task_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(
                      color: Color.fromRGBO(32, 75, 90, 1),
                      fontSize: 25,
                      wordSpacing: 3,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(text: "Let's become more "),
                      TextSpan(
                        text: "Productive",
                        style: TextStyle(
                          color: Color.fromRGBO(241, 175, 87, 1),
                        ),
                      ),
                    ]),
              ),
            ),
            const Icon(
              Icons.notification_add,
              color: Color.fromRGBO(32, 75, 90, 1),
            )
          ],
        ),
        Consumer<StateManager>(
          builder: (context,value,child)=>Container(
          margin: const EdgeInsets.symmetric(vertical: 50),
          height: MediaQuery.of(context).size.height * 0.23,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(32, 75, 90, 1),
              borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Great, your today's plan is almost done",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            wordSpacing: 3,
                            fontSize: 16,
                          ),
                        ),
                        InkWell(
                          child: Container(
                            // margin: const EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Text("View Task",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(241, 175, 87, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,25,0,25 ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          //progress indicator implementation
                          ShaderMask(
                            shaderCallback: (rect) {
                              return SweepGradient(
                                  startAngle: 0.0,
                                  endAngle: 2 * 3.142,
                                  //position for the progress
                                  stops: [value.calc(), value.calc()],
                                  center: Alignment.center,
                                  colors: [
                                    const Color.fromARGB(255, 235, 187, 125),
                                    Colors.white.withOpacity(0.2)
                                  ]).createShader(rect);
                            },
                            //the overlay that actually display the progress
                            child: Container(
                              width: 130,
                              height: 130,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 243, 202, 148)),
                            ),
                          ),
                          //this is for the inner circle of the progress indicator
                          Center(
                            child: Container(
                              alignment: Alignment.center,
                              width: 70,
                              height: 70,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(32, 75, 90, 1)),
                              child: Text(
                                "${value.calc1()}%",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ]),
          ),
        ),
        ),
        
        const Text(
          "Today's Schedule",
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(32, 75, 90, 1),
              fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Container(
            child: Wrap(
              children: [
                const TaskCard(title: "Metting with dev", timeRange: "7:00 - 8:00"),
                const TaskCard(title: "Metting with dev", timeRange: "7:00 - 8:00",illustration: "assets/images/one3.svg",),
                const TaskCard(title: "Metting with dev", timeRange: "7:00 - 8:00"),
                TaskCard(title: "Metting with dev", timeRange: "7:00 - 8:00",function:(){}),
              ],
              ),
          ),
          ),
      ]),
    );
  }
}
