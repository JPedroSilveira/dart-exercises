import 'package:cadastro/pessoa.dart';

class Cadastro {
  final List<Pessoa> _pessoas;

  Cadastro(this._pessoas);

  List<Pessoa> get pessoas => _pessoas;

  void addPessoa(Pessoa pessoa) {
    _pessoas.add(pessoa);
  }

  bool haveGender(String gender) {
    return _pessoas.any((e) => e.gender == gender);
  }

  bool onlyGender(String gender) {
    return _pessoas.every((e) => e.gender == gender);
  }

  double averageAge(String gender) {
    var pGenero = _pessoas.where((e) => e.gender == gender).toList();
    return pGenero.fold<double>(0, (acc, e) => acc + e.age) / pGenero.length;
  }

  double averageWage(String gender) {
    var pGenero = _pessoas.where((e) => e.gender == gender).toList();
    return pGenero.fold<double>(0, (acc, e) => acc + e.wage) / pGenero.length;
  }
 
  void removeAge(String gender) {
    var average = averageAge(gender);

    if (gender=='F') {
      _pessoas.removeWhere(
        (p) => p.age < average && p.gender == gender
      );
    } else {
      _pessoas.removeWhere(
        (p) => p.age > average && p.gender == gender 
      );
    }
  }
  
  String maxWage() {     
    return averageWage('M') > averageWage('F') ? 'M' : 'F';
  }

  void log() {
    print('Cadastro: $_pessoas');
  }
}