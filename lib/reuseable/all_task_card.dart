import 'package:flutter/material.dart';
import 'package:task/logic/change_to_hex.dart';
// import 'package:flutter_svg/svg.dart';

class AllTaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String timeRange;
  final String color;
  final VoidCallback delete;

  const AllTaskCard({
    Key? key,
    required this.title,
    required this.timeRange,
    required this.color,
    required this.description, required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HexColor(color),
              boxShadow: [
                BoxShadow(
                    blurRadius: 1,
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3.0,
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(4, 4)),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Color.fromRGBO(32, 75, 90, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    description,
                    maxLines: 5,
                    style: const TextStyle(
                      color: Color.fromRGBO(49, 49, 49, 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    const Icon(Icons.timelapse_outlined,
                        size: 15, color: Colors.grey),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        timeRange,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: delete,
          child: const Padding(
            padding: EdgeInsets.only(right: 10.0, top: 10),
            child: Icon(
              Icons.delete,
              color: Color.fromARGB(255, 59, 59, 59),
              size: 32,
            ),
          ),
        )
      ],
    );
  }
}
