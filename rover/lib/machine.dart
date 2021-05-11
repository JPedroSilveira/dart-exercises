import 'package:rover/message.dart';
import 'package:rover/position.dart';

final Map<String, Direction> nextPosition = {
  Moviment.left.name + Direction.east.name: Direction.north,
  Moviment.left.name + Direction.north.name: Direction.west,
  Moviment.left.name + Direction.west.name: Direction.south,
  Moviment.left.name + Direction.south.name: Direction.east,
  Moviment.right.name + Direction.east.name: Direction.south,
  Moviment.right.name + Direction.south.name: Direction.west,
  Moviment.right.name + Direction.west.name: Direction.north,
  Moviment.right.name + Direction.north.name: Direction.east,
};

/// Represents the Rover machine
class Machine {
  int _x;
  int _y;
  Direction _position;

  /// Init machine with a direction and cartesian positions [x] and [y] 
  Machine(this._position, {int x, int y}) {
    _x = x;
    _y = y;
  }

  int get x => _x;
  int get y => _y;
  Direction get position => _position;

  /// Receive a list of moviments and apply to machine
  void move(Message message) {
    var moviments = getMovimentsFromMessage(message);
    moviments.forEach((moviment) {
      if (moviment == Moviment.forward) {
        _moveForward();
      } else {
        var newPosition = nextPosition[moviment.name + _position.name];
        if (newPosition != null) {
          _position = newPosition;
        }
      }
    });
  }

  List<Moviment> getMovimentsFromMessage(Message message) {
    var movements = <Moviment>[];
    
    var messageCodes = message.shortMessage
    .replaceAll(Moviment.forward.name, '/${Moviment.forward.name}/')
    .replaceAll(Moviment.left.name, '/${Moviment.left.name}/')
    .replaceAll(Moviment.right.name, '/${Moviment.right.name}/')
    .split('/');

    var repetitions = 0;
    var isNumber = true;
    for (var i = 0; i <= messageCodes.length; i++) {
      var code = messageCodes[i];
      if (code == '') break;
      if (isNumber) {
        repetitions = int.parse(code);
      } else {
        var moviment = movimentFromName(code);
        if (moviment == null) {
          moviment = Moviment.forward;
          i--;
        }
        var newMoviments = List<Moviment>.filled(repetitions, moviment);
        movements.addAll(newMoviments);
        repetitions = null;
      }
      isNumber = !isNumber;
    }

    return movements;
  }

  /// Move machine forward, changing positions (x,y)
  void _moveForward() {
    if (_position == Direction.east) {
      _x++;
    } else if (_position == Direction.north) {
      _y++;
    } else if (_position == Direction.south) {
      _y--;
    } else { // west
      _x--;
    }
  }
}