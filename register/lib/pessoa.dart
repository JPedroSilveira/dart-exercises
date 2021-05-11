class Pessoa {
  final String _name;
  final String _gender;
  final int _age;
  final double _wage;

  Pessoa(this._name, this._gender, this._age, this._wage);

  String get name => _name;
  String get gender => _gender;
  int get age => _age;
  double get wage => _wage;

  @override
  String toString() {
    return '{ name: $_name; gender: $_gender; age: $_age; wage: $_wage; }';
  }
}