import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:provider/provider.dart';
import 'package:task/logic/db_helper.dart';
import 'package:task/logic/state_manager.dart';
import 'package:task/tabs/settings:level_page.dart';
// import 'settings:level_page.dart';
//color: Color(0xff204B5A)
//Color.fromRGBO(241, 175, 87, 1)

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var items = ["12hrs", "24hrs"];
    String dropdownValue = items[1];

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.only(top: 45, left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Settings
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Settings",
                    style: TextStyle(color: Color(0xff204B5A), fontSize: 26),
                  ),
                  Container(
                    height: 3,
                    width: 55,
                    color: const Color.fromRGBO(241, 175, 87, 1),
                  ),
                ],
              ),
            ),
            //Time Format
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  //Time format: Time Format
                  const Text(
                    "Time Format",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(146, 0, 0, 0)),
                  ),
                  //Time format: Space
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.42,
                  ),
                  //Time format: 12hr Dropdown
                  DropdownButton(
                    value: dropdownValue,
                    icon: const Padding(
                      padding: EdgeInsets.only(left: 8.0, bottom: 5.2),
                      child: Icon(FontAwesome5.sort_down),
                    ),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  )
                ],
              ),
            ),
            //Dark Mode
            Container(
              child: Row(
                children: [
                  const Text(
                    "Dark Mode",
                      style: TextStyle(
                          fontSize: 20, color: Color.fromARGB(146, 0, 0, 0))),
                  //Dark mode: Space
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  //Slider should be here
                  // ignore: avoid_unnecessary_containers
                  Switch(
                    splashRadius: 72,
                    value: Provider.of<StateManager>(context).darkModeValue,
                    onChanged: Provider.of<StateManager>(context, listen: false)
                        .toggleSwitch(),
                  )
                ],
              ),
            ),
            //Spacing above theme
            const Padding(
              padding: EdgeInsets.only(bottom: 26),
            ),
            //Theme
            const Text(
              "Theme",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            //Space above level color
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            //Theme: Level color
            GestureDetector(
              onTap: () {
                // AlertDialog(

                // );
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => 
                //     const LevelPage()
                //     ));
              },
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    //Level color icon
                    const Icon(FontAwesome5.paint_roller,
                        color: Color.fromARGB(146, 0, 0, 0)),
                    //Space behind level color
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    //Level color text
                    const Text(
                      "Level Color",
                      style: TextStyle(
                          fontSize: 20, color: Color.fromARGB(146, 0, 0, 0)),
                    ),
                    //Space in front of level color
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.48,
                    ),
                    //Forward arow icon
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color.fromARGB(136, 241, 174, 87),
                    )
                  ],
                ),
              ),
            ),
            //Theme: Sound
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  //Sound icon
                  const Icon(Icons.library_music_rounded,
                      color: Color.fromARGB(146, 0, 0, 0)),
                  //Space behind Sound
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  //Level color text
                  const Text(
                    "Sound",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(146, 0, 0, 0)),
                  ),
                  //Space in front of sound
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.575,
                    ),
                  //Forward arow icon
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromARGB(136, 241, 174, 87),
                  )
                ],
              ),
            ),
            //Theme: Accent Color
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  //Accent Color icon
                  const Icon(Icons.color_lens, color: Color.fromARGB(146, 0, 0, 0)),
                  //Space behind Accent Color
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  //Accent Color text
                  const Text(
                    "Accent Color",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(146, 0, 0, 0)),
                  ),
                  //Space in front of accent color
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                    ),
                  //Forward arow icon
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromARGB(136, 241, 174, 87),
                  )
                ],
              ),
            ),
            //Space above contact
            const Padding(padding: EdgeInsets.only(bottom: 23)),
            //Contact
            const Text(
              "Contact",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            //Space below contact
            const Padding(padding: EdgeInsets.only(bottom: 26)),
            //Twitter
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 40,
              child: Row(children: const [
                //twitter icon
                Icon(FontAwesome5.twitter, color: Color(0xff204B5A)),
                //Space btw twitter and its icon
                SizedBox(width: 24),
                //Twitter text
                Text(
                  "Twitter",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(146, 0, 0, 0)),
                )
              ]),
            ),
            //Space btw twitter and github
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            //GitHub
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 40,
              child: Row(children: const [
                //github icon
                Icon(FontAwesome5.github, color: Color(0xff204B5A)),
                //Space btw github and its icon
                SizedBox(width: 24),
                //Github text
                Text(
                  "GitHub",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(146, 0, 0, 0)),
                )
              ]),
            ),
            //Space btw twitter and github
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            //Email
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 40,
              child: Row(children: const [
                //email icon
                Icon(FontAwesome5.mail_bulk, color: Color(0xff204B5A)),
                //Space btw email and its icon
                SizedBox(width: 24),
                //Email text
                Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(146, 0, 0, 0)),
                )
              ]),
            ),
            //Space btw twitter and github
            const Padding(padding: EdgeInsets.only(bottom: 8)),
            //Request Features
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Row(children: const [
                //request icon
                Icon(Icons.add_task),
                //Space btw request and its icon
                SizedBox(width: 24),
                //request text
                Text(
                  "Request Features",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(146, 0, 0, 0)),
                )
              ]),
            ),
          ],
        ),
      )),
    );
    
  }
}
