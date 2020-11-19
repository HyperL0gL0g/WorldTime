import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name
  String time; // time
  String flag;
  String url; // location url for end point
  bool isDayTime;

  //constructor

  WorldTime({this.location, this.flag, this.url});


  Future<void> getTime() async
  {
    try {
      //make a http req
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      //  print(offset);
      DateTime now = DateTime.parse(datetime);
      //print(now);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);

      //set time
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('$e');
      time = ' no suitable time found';
    }
  }
}

//WorldTime t =  WorldTime(location : 'Berlin' , flag : 'germany.png' , url : '/Europe/Berlin');