import 'package:flutter/material.dart';
import 'package:tmely/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Load extends StatefulWidget {
  const Load({Key? key}) : super(key: key);

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {

  String time='lodaing';
void setuptime () async {
  WorldTime inst=WorldTime(location:'Kolkata',flag: 'India.png',url: 'Asia/Kolkata');
 await inst.getTime();
 Navigator.pushReplacementNamed(context, '/home',arguments: {
   'location':inst.location,
   'flag':inst.flag,
   'time':inst.time,
   'isday':inst.isDay,
 });
}
 @override
void initState() {

    super.initState();
setuptime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
child: SpinKitRotatingCircle(
  color: Colors.white,
  size: 80.0,
),
      ),
    );
  }
}
