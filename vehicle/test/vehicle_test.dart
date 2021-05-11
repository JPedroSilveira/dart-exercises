import 'dart:math';

import 'package:test/test.dart';
import 'package:vehicle/blimp.dart';
import 'package:vehicle/plane.dart';

void main() {
  test('plane without fuel', () {
    var plane = Plane(100);
    plane.addFuel(101);
    plane.goForward(200);
    expect(plane.km, 100);
    expect(plane.fuel, 0);
  });
  test('blimp with fuel enough', () {
    var plane = Blimp(200);
    plane.addFuel(100);
    plane.goForward(90);
    expect(plane.km, 90);
    expect(plane.fuel, 10);
  });
}
