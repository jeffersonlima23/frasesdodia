import 'package:flutter/material.dart';
import 'package:frasesdodia/dicionario.dart';


class HomeStateful extends StatefulWidget {
  const HomeStateful({super.key});

  @override
  State<HomeStateful> createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  
  var _texto = "Jefferson Coelho";
  
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title:  Text(tituloInsta),
        backgroundColor: Colors.green,
        
      ),
      body:  Column(
        children: [
          ElevatedButton(
            onPressed: (){
              setState(() {
                _texto = "Curso Flutter";
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ), 
            child: const Text(
              "Clique aqui",
              ),
            ),
            Text("Nome: $_texto"),
        ],
      ),
    );
  }
}


