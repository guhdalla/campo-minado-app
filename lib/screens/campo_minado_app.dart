import 'package:campo_minado_app/components/resultado_widget.dart';
import 'package:campo_minado_app/models/campo.dart';
import 'package:campo_minado_app/models/explosao_exception.dart';
import 'package:campo_minado_app/models/tabuleiro.dart';
import 'package:flutter/material.dart';

import '../components/tabuleiro_widget.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({Key? key}) : super(key: key);

  @override
  State<CampoMinadoApp> createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  int _venceu = 2;
  Tabuleiro? _tabuleiro;

  _reiniciar() {
    setState(() {
      _venceu = 2;
      _tabuleiro!.reiniciar();
    });
  }

  void _abrir(Campo campo) {
    setState(() {
      if (_venceu != 2) {
        return;
      }

      try {

        if (_tabuleiro!.resolvido) {
          _venceu = 1;
          return;
        }

        campo.abrir();

      } on ExplosaoException {
        _venceu = 0;
        _tabuleiro!.revelarBombas();
      }
    });
  }

  void _alternarMarcacao(Campo campo) {
    setState(() {
      if (_venceu != 2) {
        return;
      }
      campo.altenarMarcacao();
      if (_tabuleiro!.resolvido) {
        _venceu = 1;
      }
    });
  }

  Tabuleiro _getTabuleiro(double largura, double altura) {
    if (_tabuleiro == null) {
      int qtdColunas = 10;
      double tamanhoCampo = largura / qtdColunas;
      int qtdLinhas = (altura / tamanhoCampo).floor();

      _tabuleiro = Tabuleiro(
        linhas: qtdLinhas,
        colunas: qtdColunas,
        qtdBombas: 15,
      );
    }
    return _tabuleiro!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: _venceu,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return TabuleiroWidget(
                tabuleiro: _getTabuleiro(
                  constraints.maxWidth,
                  constraints.maxHeight,
                ),
                onAbrir: _abrir,
                onAlternarMarcacao: _alternarMarcacao,
              );
            },
          ),
        ),
      ),
    );
  }
}
