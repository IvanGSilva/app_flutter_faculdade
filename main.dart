import 'package:flutter/material.dart';
import './questao.dart';

void main() {
  // [1] lembrar de chamar app senao n vai rodar.
  runApp(PerguntaAPP());
}

class _PerguntaAppState extends State {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual sua linguagem de programação favorita?',
      'Qual é sua Unidade Curricular favorita?'
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Text('Olá Flutter'),

          Questao(perguntas[_perguntaSelecionada]),
          ElevatedButton(onPressed: _responder, child: Text('Resposta 1')),
          ElevatedButton(onPressed: _responder, child: Text('Resposta 2')), //
          ElevatedButton(onPressed: _responder, child: Text('Resposta 3')),
        ],
      ),
    ));
  }
}

class PerguntaAPP extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
