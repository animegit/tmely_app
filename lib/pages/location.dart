import 'package:flutter/material.dart';
import 'package:tmely/services/worldtime.dart';
class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
List<WorldTime> locations=[
 WorldTime(location:'Kolkata',flag: 'India.png',url: 'Asia/Kolkata'),
  WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
  WorldTime(location: 'Berlin', flag: 'berlin.png', url: 'Europe/Berlin'),
  WorldTime(location:'Seoul', flag: 'southkorea.png', url: 'Asia/Seoul'),
  WorldTime(location:'Seoul', flag: 'southkorea.png', url: 'Asia/Seoul'),
  WorldTime(location:'Seoul', flag: 'southkorea.png', url: 'Asia/Seoul'),
  WorldTime(location:'Seoul', flag: 'southkorea.png', url: 'Asia/Seoul'),
];

void updateTime(index) async{
  WorldTime inst=locations[index];
  await inst.getTime();
  // navigate to home screen
  Navigator.pop(context,{
    'location':inst.location,
    'flag':inst.flag,
    'time':inst.time,
    'isday':inst.isDay,
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Select a Location'),
        centerTitle: true,
        elevation: 0,
      ),
body: ListView.builder(itemCount: locations.length,
itemBuilder: (context,index){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
    child: Card(
      child:ListTile(
        onTap:(){
updateTime(index);
        } ,
        title: Text(locations[index].location),
        leading: CircleAvatar(
          backgroundImage:AssetImage('assets/${locations[index].flag}') ,
        ),
      )
    ),
  );
},),
    );
  }
}
