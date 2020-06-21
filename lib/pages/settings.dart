import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text('MadTrainer'.toUpperCase()),
      ),
        body: SafeArea(
            child: Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
        child: Text('test'),
      ),
    )));
  }
}
