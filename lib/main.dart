import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:tmely/pages/location.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/location.dart';
void main() {
  runApp( MaterialApp(
initialRoute: '/home',
    routes: {
  '/':(context)=>Load(),
      '/home':(context)=>Home(),
      '/location':(context)=>Location(),
    },
  ));
}

