import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String timeRange;
  final String? illustration;

  const TaskCard({Key? key, required this.title, required this.timeRange,this.illustration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: illustration == null ? Colors.white : Color.fromRGBO(251, 238, 219, 1),
          boxShadow: [
            BoxShadow(
                blurRadius: 15,
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3.0,
                offset: Offset.fromDirection(5)),
          ]),
      child: Column(
        crossAxisAlignment: illustration == null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: illustration == null ? TextAlign.center :TextAlign.left,
            style: const TextStyle(
                color: Color.fromRGBO(32, 75, 90, 1),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              timeRange,
              style: const TextStyle(
                color: Colors.grey
              ),
            ),
          ),
          illustration == null ? SizedBox():
          Container(
            margin: const EdgeInsets.only(top: 10,),
            height: 80,
            child: SvgPicture.asset("${illustration}",width: double.infinity,),
          )
        ],
      ),
    );
  }
}
