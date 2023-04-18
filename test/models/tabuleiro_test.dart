import 'package:campo_minado_app/models/campo.dart';
import 'package:campo_minado_app/models/tabuleiro.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Ganhar Jogo', () {

    Tabuleiro tabuleiro = Tabuleiro(
      linhas: 2, 
      colunas: 2, 
      qtdBombas: 0
      );

    tabuleiro.campos[0].minar();
    tabuleiro.campos[3].minar();

    tabuleiro.campos[0].altenarMarcacao();
    tabuleiro.campos[1].abrir();
    tabuleiro.campos[3].altenarMarcacao();
    tabuleiro.campos[2].abrir();

    expect(tabuleiro.resolvido, isTrue);
  });

}
