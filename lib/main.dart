import 'package:flutter/material.dart';
import 'package:madtrainer/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
  },
));