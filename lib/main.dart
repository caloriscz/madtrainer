import 'package:flutter/material.dart';
import 'package:madtrainer/pages/home.dart';
import 'package:madtrainer/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
  },
  theme: ThemeData(
      primarySwatch: Colors.blue
  ),
));