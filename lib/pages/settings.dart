import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'home.dart';
import 'dart:convert';

class Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _selectedIndex = 0;
  final _workoutController = TextEditingController(text: '45');
  List data = [];

  Future<String> loadAsset() async {
    String raw = await rootBundle.loadString('assets/settings.json');

    return raw;
  }

  someMethod() async {
    final setme = await loadAsset();

    data = json.decode(setme);

    print(data[0]["cycles"]);
  }

  void _onItemTapped(int index) {
    setState(() {
      Future<String> test = loadAsset();

      someMethod();

      print("selected index: " + index.toString());

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
        ),
        body: SafeArea(
            child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new TextFormField(
                        decoration:
                            new InputDecoration(labelText: "Enter workout in seconds"),
                        controller: _workoutController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new TextFormField(
                        decoration:
                        new InputDecoration(labelText: "Enter rest in seconds"),
                        initialValue: '18',
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new TextFormField(
                        decoration:
                        new InputDecoration(labelText: "Enter number"),
                        initialValue: '10',
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  )
                ]),
          ),
        )),
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
        ));
  }
}
