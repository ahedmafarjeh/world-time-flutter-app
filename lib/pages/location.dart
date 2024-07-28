import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/time.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<CountryTime> allCountries = [
    CountryTime(
        link: 'Africa/Cairo', countryName: 'Egypt - Cairo', flag: 'egypt.png'),
    CountryTime(
        link: 'Africa/Tunis',
        countryName: 'Tunisia - Tunis',
        flag: 'tunisia.png'),
    CountryTime(
        link: 'Africa/Algiers',
        countryName: 'Algeria - Algiers',
        flag: 'algeria.png'),
    CountryTime(
        link: 'Australia/Sydney',
        countryName: 'Australia - Sydney',
        flag: 'australia.png'),
    CountryTime(
        link: 'America/Toronto',
        countryName: 'Canada - Toronto',
        flag: 'canada.png'),
    CountryTime(
        link: 'Asia/Riyadh',
        countryName: '	Saudi Arabia - Riyadh',
        flag: 'sa.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 191, 199),
      appBar: AppBar(
        title: Text(
          "Choose Location",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        backgroundColor: Color.fromARGB(146, 12, 16, 49),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: SizedBox(
        child: ListView.builder(
          itemCount: allCountries.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () async {
                  CountryTime country = CountryTime(
                    countryName: allCountries[index].countryName,
                    flag: allCountries[index].flag,
                    link: allCountries[index].link,
                  );
                  await country.getData();
                  Navigator.pop(context, {
                    "time": country.timeNow,
                    "zone": country.timeZone,
                    "isDark": country.isDark
                  });
                },
                title: Text(
                  allCountries[index].countryName,
                  style: TextStyle(fontSize: 22),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("images/${allCountries[index].flag}"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
