import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  int quant = 0;

  TextEditingController quantidadeControler = new TextEditingController();

  void decremente() {
    setState(() {
      count--;
    });
  }

  void incremente() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == quant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CONTADOR DE PESSOAS"),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sorveteria.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  controller: quantidadeControler,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  decoration: const InputDecoration(
                    labelText: "Quantidade de Pessoas Permitidas?",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 15),
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        count = 0;
                        quant = 0;
                      });
                      quantidadeControler.clear();
                    },
                    child: Text("Resetar"),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextButton(
                      onPressed: quantidadePermitida,
                      child: Text("Salvar"),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                isFull ? "Lotado!" : "Pode Entrar",
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  "$count",
                  style: TextStyle(
                    fontSize: 100,
                    color: isFull ? Colors.red : Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: isEmpty ? Colors.grey : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: isEmpty ? null : decremente,
                    child: const Text(
                      "SAIU",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.grey : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: isFull ? null : incremente,
                    child: const Text(
                      "Entrou",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  int quantidadePermitida() {
    if (!quantidadeControler.text.isEmpty && int.parse(quantidadeControler.text.trim()) >= 0) {
      setState(() {
        quant = int.parse(quantidadeControler.text.trim());
        if (quant < count) {
          count = quant;
        }
      });
    }
    return quant;
  }
}
