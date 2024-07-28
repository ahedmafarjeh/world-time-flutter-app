import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataLoading() async {
    CountryTime country = CountryTime(link: 'Africa/Algiers',countryName: 'Algeria - Algiers', flag: 'algeria.png');
    await country.getData();
    // Navigate to the next screen & replace the current screen with the new screen in the stack.
    // and  send data to the home page
    Navigator.pushReplacementNamed(context, '/home',
        arguments: {"time": country.timeNow, "zone": country.timeZone, "isDark": country.isDark});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 209, 209),
      body: Center(
          // child: ElevatedButton(
          //   onPressed: () {
          //     getData();
          //   },
          //   child: Text("Click"),
          // ),
          child: SpinKitCircle(
        color: Colors.black,
        size: 140.0,
      )),
    );
  }
}
