import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
  final int _setWorkoutTime = 45;

  void onChange() {
    notifyListeners();
  }

  // https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple
}