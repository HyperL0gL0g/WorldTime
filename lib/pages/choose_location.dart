import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async
  {
    WorldTime i  = locations[index];
    await i.getTime();
    Navigator.pop(context , {
      'location' :  i.location,
      'flag' : i.flag,
      'time' : i.time,
      'isDayTime': i.isDayTime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title:  Text('choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context ,index)
         {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: Card(
                child : ListTile(
          onTap: (){
              updateTime(index);
          },
                  title: Text(
                    locations[index].location,
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  )
                  ,
                )
              ),
            );
         }
      ),
    );
  }
}
