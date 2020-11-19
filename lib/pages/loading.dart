import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

void setupWorldTime() async
{
  WorldTime t =  WorldTime (location : 'Berlin' , flag : 'germany.png' , url : 'Europe/Berlin');
 await t.getTime();
 Navigator.pushReplacementNamed(context, '/home', arguments: {
   'location' :  t.location,
   'flag' : t.flag,
   'time' : t.time,
   'isDayTime': t.isDayTime,
 });
}


void initState()
{
  super.initState();
  setupWorldTime();
  print("hello");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body:

      Center(
        child:  SpinKitHourGlass(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
