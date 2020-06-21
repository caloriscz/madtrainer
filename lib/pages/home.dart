import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madtrainer/pages/settings.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AnimationController _controller;
  int _selectedIndex = 0;
  bool _isButtonDisabled =
      false; // make button disabled when exercising otherwise illegal boost

  int _rounds = 12; // cycles
  int _workout = 45; // workout time in seconds
  int _rest = 18; // resting time in seconds
  Timer _timer;

  void startIt() {
    int _round = _workout + _rest;
    int _routine = _rounds * _round;

    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_routine < 1) {
            _isButtonDisabled = false;
            timer.cancel();
          } else {
            _isButtonDisabled = true;

            if (_workout < 1) {
              _rest = _rest - 1;

              if (_rest < 1) {
                _workout = 45;
                _rest = 18;
                _rounds--;
                _routine = _rounds * _round;
              }
            } else {
              _workout = _workout - 1;
            }
            _routine = _round - 1;
          }
        },
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Settings()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text('MadTrainer'.toUpperCase()),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Steps'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$_rounds',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Workout'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$_workout',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Stretch'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black54,
                          letterSpacing: 2.0,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$_rest',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          _isButtonDisabled ? null : startIt();
                        });
                      },
                      child: Text('Start'.toUpperCase()),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          _timer.cancel();
                          _workout = 45;
                          _rest = 18;
                          _rounds = 0;
                        });
                      },
                      child: Text('Stop'.toUpperCase()),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
