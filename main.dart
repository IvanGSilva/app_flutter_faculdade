import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() {
  runApp(PerguntaAPP());
}

class _PerguntaAppState extends State<PerguntaAPP> {
  var _perguntaSelecionada = 0;
  String _feedback = '';  // Feedback de resposta
  int _acertos = 0;  // Contador de acertos

  // Função para avançar para a próxima pergunta ou reiniciar
  void _proximaPergunta() {
    // Verifica se o usuário chegou à última pergunta
    if (_perguntaSelecionada < 2) {
      setState(() {
        _feedback = ''; // Reseta o feedback
        _perguntaSelecionada++;  // Avança para a próxima pergunta
      });
    } else {
      // Verifica o resultado final
      setState(() {
        if (_acertos == 3) {
          _feedback = 'Você ganhou! 🎉';  // Acertou todas as perguntas
        } else {
          _feedback = 'Você não acertou todas, tente de novo. 😔';  // Errou alguma pergunta
        }
        _acertos = 0; // Reseta os acertos
        _perguntaSelecionada = 0; // Reinicia o quiz
      });
    }
  }

  // Função para verificar a resposta e mostrar feedback
  void _responder(int indiceResposta) {
    setState(() {
      if (indiceResposta == perguntas[_perguntaSelecionada]['resposta_correta']) {
        _acertos++;  // Incrementa acertos
        _feedback = 'Você acertou! 🎉';
      } else {
        _feedback = 'Resposta errada. Tente novamente. 😔';
      }
    });

    // Avança para a próxima pergunta após um pequeno atraso (2 segundos)
    Future.delayed(Duration(seconds: 1), _proximaPergunta);
  }

  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Qual sua linguagem de programação favorita?',
      'respostas': ['C', 'Java', 'JS', 'PHP', 'Todo poderoso Dart'],
      'resposta_correta': 4, // O índice da resposta correta (Todo poderoso Dart)
    },
    {
      'texto': 'Qual sua UC favorita?',
      'respostas': ['A do Miguel', 'A do Xálatin', 'A do Paes', 'A do Barba'],
      'resposta_correta': 2, // O índice da resposta correta (A do Paes)
    },
    {
      'texto': 'Qual seu personagem favorito?',
      'respostas': ['Frodo', 'Harry', 'Ash', 'Ryu'],
      'resposta_correta': 1, // O índice da resposta correta (Harry)
    }
  ];

  @override
  Widget build(BuildContext context) {
    // Obtendo as respostas da pergunta atual
    var listaRespostas =
        perguntas[_perguntaSelecionada]['respostas'] as List<String>?;

    // Criando a lista de widgets de Resposta com o índice
    List<Widget> respostas = listaRespostas?.asMap().entries.map((entry) {
      int index = entry.key;
      String textoResp = entry.value;
      return Resposta(
        textoResp,
        () => _responder(index), // Passando o índice da resposta
      );
    }).toList() ?? [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'] as String),
            ...respostas, // Exibindo as respostas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _feedback,  // Exibindo o feedback
                style: TextStyle(
                  fontSize: 20,
                  color: _feedback.contains('acertou') ? Colors.green : Colors.red,
                ),
              ),
            ),
            // Removemos o botão "Próxima Pergunta", já que a navegação é automática
          ],
        ),
      ),
    );
  }
}

class PerguntaAPP extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
