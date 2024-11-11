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
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual sua linguagem de programação favorita?',
        'respostas': ['C', 'Java', 'JS', 'PHP', 'Todo poderoso Dart'],
      },
      {
        'texto': 'Qual sua UC favorita?',
        'respostas': ['A do Miguel', 'A do xálatin', 'A do Paes', 'A do Barba'],
      },
      {
        'texto': 'Qual seu personagem favorito?',
        'respostas': ['Frodo', 'Harry', 'Ash', 'Ryu'],
      }
    ];

    List<Widget> respostas = [];

    var listaRespostas =
        perguntas[_perguntaSelecionada]['respostas'] as List<String>?;

    if (listaRespostas != null) {
      for (String textoResp in listaRespostas) {
        respostas.add(Resposta(textoResp, _responder));
      }
    }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Questao(perguntas[_perguntaSelecionada]['texto'] as String),
          ...respostas,
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
