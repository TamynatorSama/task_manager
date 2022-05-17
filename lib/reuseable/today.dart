import 'package:flutter/material.dart';
import 'package:task/reuseable/all_task_card.dart';

class TodayCard extends StatelessWidget {
  final String color;
  final String title;
  final String description;
  final String timeRange;
  final VoidCallback delete;

  const TodayCard(
      {Key? key,
      required this.color,
      required this.title,
      required this.description,
      required this.timeRange,
      required this.delete,})
      : super(key: key);

  ///dummy data in todat

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Column(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  Container(
                    height: 100,
                    width: 2,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(32, 75, 90, 1)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AllTaskCard(
                color: color,
                title: title,
                timeRange: timeRange,
                delete: delete,
                description: description,
              ),
            ),
          ],
        ),
    );
  }
}
