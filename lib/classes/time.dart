import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class CountryTime {
  String countryName = "";
  String flag = "";
  String link = "";

  CountryTime({
    required this.countryName,
    required this.flag,
    required this.link,
  });
  late bool isDark; // late يعني رح تحصل على القيمة تبعتها بعدين
  String timeZone = "";
  String timeNow = "";
  getData() async {
    // get data from endpoint API (from internet or from server)
    // await : انه هاد الكود رح ياخذ وقت ليخلص فلازم استنى
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$link'));
    Map receivedData = jsonDecode(response.body);
    timeZone = receivedData["timezone"];
    DateTime currentTime = DateTime.parse(receivedData["utc_datetime"]);
    int offset = int.parse(receivedData["utc_offset"].substring(0, 3));
    currentTime = currentTime.add(Duration(hours: offset));
    print(currentTime);
    // if the hour between 5 am and 6 pm then it is light, else it is dark
    if (currentTime.hour > 5 && currentTime.hour < 20) {
      isDark = false;
    } else {
      isDark = true;
    }
    
    timeNow = DateFormat("hh:mm a").format(currentTime);
  }
}
