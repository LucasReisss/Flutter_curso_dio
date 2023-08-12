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
  IMC imc = IMC();
  var imcRepository = IMCRepository();
  DateTime now = DateTime.now();
  String? time;

  var _listaImc = <IMC>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterIMCs();
  }

  void obterIMCs() async {
    _listaImc = await imcRepository.listarIMCs();
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
                      imc.resultado(
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
                              onPressed: () async {
                                try {
                                  now = DateTime.now();
                                  imc.setPeso(
                                      double.parse(pesoController.text));
                                  imc.setAltura(
                                      double.parse(alturaController.text));
                                  time = DateFormat('HH:mm').format(now);
                                  imc.setTime(time!);

                                  await imcRepository.adicionarIMC(IMC(
                                      peso: imc.getPeso(),
                                      altura: imc.getAltura(),
                                      time: imc.getTime()));

                                  imc.calcularIMC();
                                } catch (e) {
                                  debugPrint("$e");
                                }

                                setState(() {
                                  
                                });
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
                        itemCount: _listaImc.length,
                        itemBuilder: (BuildContext context, int index) {
                          var imc = _listaImc[index];
                          return Column(
                            children: [
                              ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  ListTile(
                                    title: Text(imc.calcularIMC()),
                                    subtitle: Text(
                                        "Peso: ${imc.getPeso()}, Altura: ${imc.getAltura()}"),
                                    trailing: Text(" ${imc.getTime()}"),
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
