class Pessoa {
  String? nome;
  double? peso;
  double? altura;

  double imc() {
    double imc = (peso! / (altura! * altura!));

    imc = double.parse(imc.toStringAsPrecision(2));

    print("imc: $imc ");

    if(imc < 16) {
      print("Magreza grave");
    }else if (imc >= 16 && imc < 17) {
      print("Magreza moderada");
    }else if(imc >= 17 && imc < 18.5) {
      print("Magreza leve");
    }else if(imc >= 18.5 && imc < 25) {
      print("Saúdavel");
    }else if(imc >= 25 && imc < 30) {
      print("Sobrepeso");
    }else if(imc >= 30 && imc < 35) {
      print("Obsidade Grau I");
    }else if(imc >= 35 && imc < 40) {
      print("Obsidade Grau II (severa)");
    } else {
      print("Obsidade Grau III (mórbita)");
    }

    return imc;
  }

}
