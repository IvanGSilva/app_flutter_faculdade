import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() {
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
          

          Questao(perguntas[_perguntaSelecionada]),
          Resposta('Resposta 1', _responder),
          Resposta('Resposta 2', _responder),
          Resposta('Resposta 3', _responder),
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
