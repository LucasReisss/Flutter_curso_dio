import 'package:imc/Pessoa.dart';
import 'package:test/test.dart';

void main() {
  var p1 = Pessoa();
  p1.nome = "erica";
  p1.peso = 50;
  p1.altura = 1.50;

  var p2 = Pessoa();
  p2.nome = "João";
  p2.peso = 80;
  p2.altura = 1.70;

  var p3 = Pessoa();
  p3.peso = 95;
  p3.altura = 1.68;

  var p4 = Pessoa();
  p4.peso = 110;
  p4.altura = 1.75;

  var p5 = Pessoa();
  p5.peso = 150;
  p5.altura = 1.75;

  var p6 = Pessoa();
  p6.peso = 45;
  p6.altura = 1.60;

  var p7 = Pessoa();
  p7.peso = 45;
  p7.altura = 1.70;

  var p8 = Pessoa();
  p8.peso = 30;
  p8.altura = 1.70;

  test('imc Saúdavel', () {
    expect(p1.imc(), equals(22.0));
  });

  test('imc Sobrepeso', () {
    expect(p2.imc(), equals(28.0));
  });

  test('Obsidade Grau I', () {
    expect(p3.imc(), equals(34));
  });

  test('Obsidade Grau II', () {
    expect(p4.imc(), equals(36));
  });

  test('Obsidade Grau III', () {
    expect(p5.imc(), equals(49));
  });

  test('Magreza leve', () {
    expect(p6.imc(), equals(18));
  });

  test('Magreza moderada', () {
    expect(p7.imc(), equals(16));
  });

  test('Magreza grave', () {
    expect(p8.imc(), equals(10));
  });
}
