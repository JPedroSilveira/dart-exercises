import 'package:rover/machine.dart';
import 'package:rover/message.dart';
import 'package:rover/position.dart';
import 'package:test/test.dart';

void main() {
  test('Moviments: right, forward, forward, left, forward, left', () {
    var machine = Machine(Direction.north, x: 7, y: 3);
    var humanMessage = 'RAALAL';
    var message = Message(humanMessage);
    machine.move(message);

    expect(machine.x, 9);
    expect(machine.y, 4);
  });
  
  test('Moviments: forward, forward, forward', () {
    var machine = Machine(Direction.south, x: 0, y: 0);
    var humanMessage = 'AAA';
    var message = Message(humanMessage);
    machine.move(message);

    expect(machine.x, 0);
    expect(machine.y, -3);
  });

  test('Moviments: all directions without move', () {
    var machine = Machine(Direction.south, x: 0, y: 0);
    var humanMessage = 'ALALALA';
    var message = Message(humanMessage);
    machine.move(message);

    expect(machine.x, 0);
    expect(machine.y, 0);
  });

  test('Moviments: move to left from west', () {
    var machine = Machine(Direction.west, x: 0, y: 0);
    var humanMessage = 'LAAA';
    var message = Message(humanMessage);
    machine.move(message);

    expect(machine.x, 0);
    expect(machine.y, -3);
  });

  test('Moviments: move to right from east', () {
    var machine = Machine(Direction.east, x: 0, y: 0);
    var humanMessage = 'RAAA';
    var message = Message(humanMessage);
    machine.move(message);

    expect(machine.x, 0);
    expect(machine.y, -3);
  });

  test('Moviments: encode big human command', () {
    var machine = Machine(Direction.north, x: 0, y: 0);
    var humanMessage = 'AAAAAAAAAAAAAAAALLAAARRAAAAAALLLAAAAARRRRAAAAARAARLRL';
    var message = Message(humanMessage);
    machine.move(message);

    expect(machine.x, 10);
    expect(machine.y, 17);
  });
}
