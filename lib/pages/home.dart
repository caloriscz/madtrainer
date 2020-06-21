import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madtrainer/pages/settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _onItemTapped(int index) {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Settings()),
      );
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
                    Text('10',
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
                      '00:45',
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
                      '00:20',
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
                      onPressed: () {},
                      child: Text('Start'.toUpperCase()),
                    ),
                    RaisedButton(
                      onPressed: () {},
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
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
