import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
     data =  data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
     print(data);
     //set back ground
    String bgimage = data['isDayTime'] ? 'day.png'  : 'night.png';
    Color bgcolor = data['isDayTime'] ? Colors.blue  : Colors.indigo[700];
     
    return Scaffold(
      backgroundColor: bgcolor,
     body : SafeArea(
       child: Container(
      decoration: BoxDecoration(
        image :  DecorationImage(
          image : AssetImage('assets/$bgimage'),
          fit: BoxFit.cover,
        )
      ),
         child: Padding(
           padding: const EdgeInsets.fromLTRB( 0, 120,0, 0),
           child: Column(
             children: [
               RaisedButton.icon(onPressed: () async {
              dynamic result  =  await Navigator.pushNamed(context, '/location');
              setState(() {
                data = {
                  'time'  : result['time'],
                  'location' : result['location'],
                  'isDayTime' : result['isDayTime'],
                  'flag' : result['flag'],
                };
              });
               },
                   icon:Icon(Icons.edit_location),
                   label:Text('edit location'),
               ),
               SizedBox(height: 20.0),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     data['location'],
                     style: TextStyle(
                       fontSize: 28.0,
                       letterSpacing: 2.0,
                     ),
                   )
                 ],
               ),
                SizedBox(height: 20.0),
               Text(
                 data['time'],
                 style: TextStyle(
                   fontSize: 67.0,

                 ),
               )

             ],
           ),
         ),
       ),
     ),
    );
  }
}
