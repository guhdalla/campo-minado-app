import 'package:campo_minado_app/components/campo_widget.dart';
import 'package:campo_minado_app/models/tabuleiro.dart';
import 'package:flutter/material.dart';

import '../models/campo.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcacao;

  const TabuleiroWidget(
      {super.key,
      required this.tabuleiro,
      required this.onAbrir,
      required this.onAlternarMarcacao});

  List<CampoWidget> _getListCampo() {
    List<CampoWidget> listCampoWidget = [];
    tabuleiro.campos.forEach((campo) => listCampoWidget.add(CampoWidget(
          campo: campo,
          onAbrir: onAbrir,
          onAlternarMarcacao: onAlternarMarcacao,
        )));
    return listCampoWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: _getListCampo(),
      ),
    );
  }
}
