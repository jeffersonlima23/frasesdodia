
import 'package:flutter/material.dart';
import 'package:frasesdodia/tela.dart';

// Stateless - Widgets que nao podem sofrer alteracoes(constantes).
// Stateful - Widgets que podem sofrer alteracoes (dinamicas).

void main(){
  runApp(  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful(),
    ),
  );
}