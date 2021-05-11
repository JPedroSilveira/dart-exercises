/// Define machine direction 
enum Direction { north, south, west, east }

/// Define machine moviment
enum Moviment { left, right, forward }

final Map<Moviment, String> _movementName = {
  Moviment.forward: 'A',
  Moviment.left: 'L',
  Moviment.right: 'R'
};

final Map<String, Moviment> _movementFromName = {
  'A': Moviment.forward,
  'L': Moviment.left,
  'R': Moviment.right
};

final Map<Direction, String> _directionName = {
  Direction.north: 'A',
  Direction.south: 'L',
  Direction.west: 'R',
  Direction.east: 'E'
};

extension DirectionExtension on Direction {
  String get name {
    return _directionName[this];
  }
}

extension MovimentExtension on Moviment {
  String get name {
    return _movementName[this];
  }
}

Moviment movimentFromName(String moviment) {
  return _movementFromName[moviment];
}