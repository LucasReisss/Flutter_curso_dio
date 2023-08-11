import 'package:app_imc/model/pessoa.dart';

class PessoaRepository {
  List<Pessoa> _pessoas = [];

  Future<void> adicionarPessoa(Pessoa pessoa) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _pessoas.add(pessoa);
  }

  void alterar(String id, bool concluido) async{
    await Future.delayed(const Duration(milliseconds: 200));
    _pessoas.where((pessoa) => pessoa.getId() == id).first.setConcluido(concluido);
  }

  Future<List<Pessoa>> listarPessoas() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _pessoas;
  }
}