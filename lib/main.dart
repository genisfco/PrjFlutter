import 'package:flutter/material.dart';
import './botoes.dart';

void main() {
  runApp(const PerguntasApp());
}

class PerguntasApp extends StatelessWidget {
  const PerguntasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>  {
  final perguntas = [
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco', 'Azul', 'Rosa'],
      },
      {
      'pergunta': 'Qual é o seu animal favorito?',
      'respostas': ['Cachorro', 'Gato', 'Coelho', 'Pássaro', 'Peixe', 'Cavalo'],
      },
      {
      'pergunta': 'Qual é o seu time?',
      'respostas': ['Palmeiras', 'Flamengo', 'Corinthians', 'São Paulo', 'Santos'],    
    }  
  ];

 var indicePergunta = 0;

 void responder() {
  if (indicePergunta < perguntas.length - 1) {
    indicePergunta++;
  } else {
    indicePergunta = 0;
  }
  setState(() {});
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genis Ferreira', style: TextStyle(fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.amber,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              perguntas[indicePergunta]['pergunta'].toString(),
              style: TextStyle(fontSize: 25)
            ),
            SizedBox(height: 20,),
            ...((perguntas[indicePergunta]['respostas'] as List<String>)
                .map((textoBotao) => Botoes(resp: responder, txt: textoBotao)) 
                .toList()),            ],
        ),
      ),
    );
  }

}
