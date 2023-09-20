//import 'dart:convert';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frasesdodia/dicionario.dart';
//import 'package:http/http.dart' as http;

class HomeStateful extends StatefulWidget {
  const HomeStateful({super.key});

  @override
  State<HomeStateful> createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {

  var frases = [
    "Texto 1",
    "Texto 2",
    "Texto 3",
  ];

  var _fraseGerada = "Clique abaixo para gerar uma nova frase";

  //Gerar frase aleatoria 
  void _gerarFrase() {
    var numeroAleatorio = Random().nextInt(frases.length);
    setState(() {
      _fraseGerada = frases[numeroAleatorio];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(tituloInsta),
        backgroundColor: Colors.green,
      ),
      body:  Container(
        padding: const EdgeInsets.all(50),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.asset("images/logo.png"),
           Text(
            _fraseGerada,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            )),
          ElevatedButton(
            onPressed: (
              _gerarFrase), 
              child: Text(
                novaFrase,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
              ),
        ], 
        )
      )
    );
  }
}