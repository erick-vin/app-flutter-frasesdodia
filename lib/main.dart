import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    "Que o seu dia comece bem e termine ainda melhor",
    "Pra hoje: sorrisos bobos, uma mente tranquila e um coração cheio de paz.",
    "Às vezes as coisas demoram, mas acontecem. O importante é saber esperar e não perder a fé!",
    "Imagine uma nova história para a sua vida e acredite nela.",
    "Nem todos os dias são bons, mas há algo bom em cada dia.",
    "Levanta, sacode a poeira e dá a volta por cima.",
    "Um pequeno pensamento positivo pela manhã pode mudar todo o seu dia.",
    "Que os dias ruins se tornem raros e os bons virem rotina.",
    "Não se preocupe em entender, viver ultrapassa qualquer entendimento.",
  ];
  var antigoNumeroSorteado = 10;
  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase() {
    var novoNumeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      if (antigoNumeroSorteado != novoNumeroSorteado) {
        _fraseGerada = _frases[novoNumeroSorteado];
        antigoNumeroSorteado = novoNumeroSorteado;
      } else {
        _gerarFrase();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png"),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
              ),
              ElevatedButton(
                onPressed: _gerarFrase,
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
