import 'dart:io';
import 'package:imc/Pessoa.dart';

void main(List<String> arguments) {


  var p1 = Pessoa();
  print("Insira o nome: ");
  p1.nome = stdin.readLineSync();

  while (p1.peso == null && p1.altura == null) {
    try {
      print("Insira o peso: ");
      p1.peso = double.parse(stdin.readLineSync()!);

      print("Insira a altura");
      p1.altura = double.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Digite apenas números");
    }
  }

  p1.imc();
}
