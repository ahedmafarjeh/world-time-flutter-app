import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map receivedData = {};
  String img_name = "";
  @override
  Widget build(BuildContext context) {
    // get data from loading page (previous page)
    // check if map is empty
    if (receivedData.isEmpty) {
      receivedData = ModalRoute.of(context)!.settings.arguments as Map;
      img_name = receivedData["isDark"] ? "night.png" : "day.png";
    }
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 60, 56, 56),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/$img_name"), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, "/location");

                    setState(() {
                      if (result == null) {
                        receivedData = {
                          "time": "",
                          "zone": "Please choose country",
                          "isDark": true
                        };
                      } else {
                        receivedData = {
                          "time": result["time"],
                          "zone": result["zone"],
                          "isDark": result["isDark"]
                        };
                      }
                      img_name =
                          receivedData["isDark"] ? "night.png" : "day.png";
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Color.fromARGB(255, 255, 129, 129),
                    size: 24.0,
                  ),
                  label: Text(
                    "Edit location",
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(146, 90, 104, 223)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  color: Color.fromARGB(155, 69, 66, 66),
                  child: Column(
                    children: [
                      Text(
                        receivedData["time"],
                        style: TextStyle(color: Colors.white, fontSize: 45),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(receivedData["zone"],
                          style: TextStyle(color: Colors.white, fontSize: 28)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
