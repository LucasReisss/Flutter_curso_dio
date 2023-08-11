import 'package:app_imc/model/pessoa.dart';
import 'package:app_imc/repository/pessoa_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController pesoController = TextEditingController(text: "");
  TextEditingController alturaController = TextEditingController(text: "");
  Pessoa pessoa = Pessoa();
  var pessoaRepository = PessoaRepository();
  DateTime? now;
  String? time;

  var _listaPessoa = <Pessoa>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    now = DateTime.now();
    obterPessoas();
  }

  void obterPessoas() async {
    _listaPessoa = await pessoaRepository.listarPessoas();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("IMC"),
          ),
          body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.all(16),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Peso"),
                      controller: pesoController,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Altura"),
                      controller: alturaController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      pessoa.resultado(
                          peso: pesoController.text,
                          altura: alturaController.text),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                try {
                                  setState(() {
                                    now = DateTime.now();
                                    pessoa.calcularIMC();

                                    pessoa.setPeso(
                                        double.parse(pesoController.text));
                                    pessoa.setAltura(
                                        double.parse(alturaController.text));
                                    time = DateFormat('HH:mm').format(now!);
                                    pessoa.setTime(time!);

                                    pessoaRepository.adicionarPessoa(Pessoa(
                                        peso: pessoa.getPeso(),
                                        altura: pessoa.getAltura(),
                                        time: pessoa.getTime()));
                                  });
                                } catch (e) {
                                  debugPrint("$e");
                                }

                                obterPessoas();
                              },
                              child: const Text(
                                "Calcular",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Histórico",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      padding: const EdgeInsets.all(16),
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: ListView.builder(
                        itemCount: _listaPessoa.length,
                        itemBuilder: (BuildContext context, int index) {
                          var pessoa = _listaPessoa[index];
                          return Column(
                            children: [
                              ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  ListTile(
                                    title: Text(pessoa.calcularIMC()),
                                    subtitle: Text(
                                        "Peso: ${pessoa.getPeso()}, Altura: ${pessoa.getAltura()}"),
                                    trailing: Text(" ${pessoa.getTime()}"),
                                  ),
                                  const Divider(),
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )),
          )),
    );
  }
}
