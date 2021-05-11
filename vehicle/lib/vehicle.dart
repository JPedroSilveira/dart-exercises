abstract class Vehicle {
  bool _on = false;
  int _fuel = 0;
  final int _maxFuel;

  Vehicle(this._maxFuel);

  bool get on => _on;
  int get fuel => _fuel;

  void addFuel(int receivedFuel) {
    final newFuel = _fuel + receivedFuel;
    _fuel = newFuel > _maxFuel ? _maxFuel : newFuel;
  }

  void removeFuel(int removedFuel) {
    final newFuel = _fuel - removedFuel;
    _fuel = newFuel < 0 ? 0 : newFuel;
  }

  void turnOn() {
    _on = true;
  }

  void turnOff() {
    _on = false;
  }
}
