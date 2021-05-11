import 'dart:async';

import 'package:vehicle/vehicle.dart';

class Aircraft extends Vehicle {
  int _km = 0;
  int get km => _km;
  
  Aircraft(int maxFuel) : super(maxFuel);
  
  void goForward(int km) {
    if (fuel > km) {
      _km += km;
      removeFuel(km);
    } else {
      _km += fuel;
      removeFuel(km);
    }
  }
}