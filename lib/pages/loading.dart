import 'dart:io';

import 'package:flutter/material.dart';
import 'package:madtrainer/pages/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void continueHome() {
    try {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),);
    } catch (e) {
      print('Něco se posralo i teď znovu: $e');
      exit(1);
    }
  }

  @override
  void initState() {
    super.initState();
    continueHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
