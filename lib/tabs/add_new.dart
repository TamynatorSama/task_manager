import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();

    Widget showDateDialog() {
      return DatePickerDialog(
          initialDate: DateTime.now(),
          firstDate: DateTime.utc(1999, 1, 1),
          lastDate: DateTime.utc(2240, 12, 12));
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  hintText: "Title", border: InputBorder.none),
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Text(
                  "From",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 20,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(32, 75, 90, 1),
                              width: 2,
                              style: BorderStyle.solid))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: InkWell(
                    onTap: () {
                      showDateDialog();
                    },
                    child: const Icon(
                      Icons.date_range,
                    ),
                  ),
                )
              ],
            ),
             const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Padding(
                  padding:  EdgeInsets.only(left:50.0),
                  child:  Text(
                    "To",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 20,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(32, 75, 90, 1),
                              width: 2,
                              style: BorderStyle.solid))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: InkWell(
                    onTap: () {
                      showDateDialog();
                    },
                    child: const Icon(
                      Icons.date_range,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Description",style: TextStyle(color: Colors.black54,fontSize: 30,fontWeight: FontWeight.bold,),),
            Container(
              padding: EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(32, 75, 90, 1),
                  width: 1.0
                ),
              ),
              child: const Expanded(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none
                  ),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             const Text("Levels",style: TextStyle(color: Colors.black54,fontSize: 30,fontWeight: FontWeight.bold,),),
          ],
        ),
      ),
    );
  }
}
