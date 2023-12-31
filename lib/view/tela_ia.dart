import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeStateful extends StatefulWidget {
  const HomeStateful({Key? key}) : super(key: key);

  @override
  State<HomeStateful> createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  var _generatedResponse = "Gerar frase";

  //Integracao com a OpenIA - token de API do OpenAI
  Future<void> _generateResponse() async {
    const openaiApiKey = "SUA CHAVE AQUI!!!";
    const apiUrl = "https://api.openai.com/v1/chat/completions";

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $openaiApiKey",
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": "Gerar frase motivacional curta"}
        ],
        "temperature": 0.7
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final generatedMessage = data["choices"][0]["message"]["content"];

      setState(() {
        _generatedResponse = generatedMessage;
      });
    } else {
      setState(() {
        _generatedResponse = "Erro ao gerar resposta.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Integração com OpenAI"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/logo.png"),
            Text(
              _generatedResponse,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _generateResponse();
              },
              child: const Text(
                "Gerar Resposta",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
