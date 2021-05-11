import 'package:cadastro/cadastro.dart';
import 'package:cadastro/pessoa.dart';
import 'package:test/test.dart';

void main() {
  test('Remove Age M/F', () {
    final m = 'M';
    final f = 'F';

    var pessoa1 = Pessoa('Maria', f, 60, 3000);
    var pessoa2 = Pessoa('Jose', m, 30, 2000);
    var pessoa3 = Pessoa('Josa', f, 10, 2000);
    var pessoa4 = Pessoa('Mario', m, 10, 2000);

    var cadastro = Cadastro([pessoa1, pessoa2, pessoa3, pessoa4]);

    cadastro.removeAge(f);
    cadastro.removeAge(m);
    print(cadastro.pessoas);
    expect(cadastro.pessoas[0].name, pessoa1.name);
    expect(cadastro.pessoas[1].name, pessoa4.name);
  });

  test('Mix genders', () {
    final m = 'M';
    final f = 'F';

    var pessoa1 = Pessoa('Maria', f, 60, 3000);
    var pessoa2 = Pessoa('Jose', m, 30, 2000);
    var pessoa3 = Pessoa('Josa', f, 10, 2000);
    var pessoa4 = Pessoa('Mario', m, 10, 2000);

    var cadastro = Cadastro([pessoa1, pessoa2, pessoa3, pessoa4]);

    expect(cadastro.haveGender(f), true);
    expect(cadastro.haveGender(m), true);
    expect(cadastro.onlyGender(f), false);
    expect(cadastro.onlyGender(m), false);
  });

  test('Only womem', () {
    final m = 'M';
    final f = 'F';

    var pessoa1 = Pessoa('Maria', f, 60, 3000);
    var pessoa3 = Pessoa('Josa', f, 10, 2000);

    var cadastro = Cadastro([pessoa1, pessoa3]);

    expect(cadastro.haveGender(f), true);
    expect(cadastro.haveGender(m), false);
    expect(cadastro.onlyGender(f), true);
    expect(cadastro.onlyGender(m), false);
  });

  test('Only mem', () {
    final m = 'M';
    final f = 'F';

    var pessoa2 = Pessoa('Jose', m, 30, 2000);
    var pessoa4 = Pessoa('Mario', m, 10, 2000);

    var cadastro = Cadastro([pessoa2, pessoa4]);

    expect(cadastro.haveGender(m), true);
    expect(cadastro.haveGender(f), false);
    expect(cadastro.onlyGender(m), true);
    expect(cadastro.onlyGender(f), false);
  });

  test('Average age', () {
    final m = 'M';
    final f = 'F';

    var pessoa1 = Pessoa('Maria', f, 60, 3000);
    var pessoa2 = Pessoa('Jose', m, 30, 2000);
    var pessoa3 = Pessoa('Josa', f, 10, 2000);
    var pessoa4 = Pessoa('Mario', m, 10, 2000);

    var cadastro = Cadastro([pessoa1, pessoa2, pessoa3, pessoa4]);

    expect(cadastro.averageAge(m), 20);
    expect(cadastro.averageAge(f), 35);
  });

  test('Average wage', () {
    final m = 'M';
    final f = 'F';

    var pessoa1 = Pessoa('Maria', f, 60, 3000);
    var pessoa2 = Pessoa('Jose', m, 30, 2000);
    var pessoa3 = Pessoa('Josa', f, 10, 2000);
    var pessoa4 = Pessoa('Mario', m, 10, 2000);

    var cadastro = Cadastro([pessoa1, pessoa2, pessoa3, pessoa4]);

    expect(cadastro.averageWage(m), 2000);
    expect(cadastro.averageWage(f), 2500);
  });

  test('Max wage', () {
    final m = 'M';
    final f = 'F';

    var pessoa1 = Pessoa('Maria', f, 60, 3000);
    var pessoa2 = Pessoa('Jose', m, 30, 2000);
    var pessoa3 = Pessoa('Josa', f, 10, 2000);
    var pessoa4 = Pessoa('Mario', m, 10, 2000);

    var cadastro = Cadastro([pessoa1, pessoa2, pessoa3, pessoa4]);

    expect(cadastro.maxWage(), f);
  });
}
