import 'package:flutter/material.dart';

class Pessoa {
  String _id = UniqueKey().toString();
  double _peso = 0.0;
  double _altura = 0.0;
  bool _concluido = false;
  String _time = "";

  Pessoa({double peso = 0.0, double altura = 0.0, String time = ""}) : _altura = altura, _peso = peso, _time = time;

  String getId() {
    return _id;
  }

  void setConcluido(bool concluido) {
    _concluido = concluido;
  }

  double getPeso() {
    return _peso;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  double getAltura() {
    return _altura;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  bool get concluido{
    return _concluido;
  }

  String getTime(){
    return _time;
  }

  void setTime(String time) {
    _time = time;
  }


  String calcularIMC() {
    if (_altura == 0 || _peso <= 0) {
      return "Valores inválidos";
    }

    double imc = (_peso / (_altura * _altura));
    imc = double.parse(imc.toStringAsPrecision(2));

    if (imc < 16) {
      return "Magreza grave, IMC: $imc";
    } else if (imc >= 16 && imc < 17) {
      return "Magreza moderada, IMC: $imc";
    } else if (imc < 18.5) {
      return "Magreza leve, IMC: $imc";
    } else if (imc < 25) {
      return "Saúdavel, IMC: $imc";
    } else if (imc < 30) {
      return "Sobrepeso, IMC: $imc";
    } else if (imc < 35) {
      return "Obsidade Grau I, IMC: $imc";
    } else if (imc < 40) {
      return "Obsidade Grau II (severa), IMC: $imc";
    } else {
      return "Obsidade Grau III (mórbita), IMC: $imc";
    }
  }

    String resultado({required var peso, required var altura}){
    var resultado = "Resultado";
    if (peso.isNotEmpty && altura.isNotEmpty){
      resultado = calcularIMC();
    }
    return resultado;
  }
}
