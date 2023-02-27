import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  String location="";
  String time="";
  String flag="";//url to images
  String url="";
  bool isDay=false;

  WorldTime({required this.location,required this.flag,required this.url});



  Future<void> getTime() async{
    Response res =

    await get(Uri.parse('http://worldtimeapi.org/api/$url'));
      // Response res=(await Uri.parse(''));
      Map data=jsonDecode(res.body);
      print(data);
//properties from data
      String datetime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);


      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours:int.parse(offset)));
      //setting time
      isDay=now.hour>6 && now.hour<20?true:false;
      time=DateFormat.jm().format(now);



  }


}

