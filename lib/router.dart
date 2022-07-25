import 'package:flutter/material.dart';
import 'package:task_app/screens/home_screen.dart';

class RouterApp {
  static Map<String,Widget Function(BuildContext)> main = {
    Home.url :(context) => Home() 
  };
}