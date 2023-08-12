import 'package:app_imc/model/pessoa.dart';

class IMCRepository {
  List<IMC> _imcs = [];

  Future<void> adicionarIMC(IMC imc) async {
    await Future.delayed(const Duration(milliseconds: 10));
    _imcs.add(imc);
  }

  Future<List<IMC>> listarIMCs() async {
    await Future.delayed(const Duration(milliseconds: 10));
    return _imcs;
  }
}
