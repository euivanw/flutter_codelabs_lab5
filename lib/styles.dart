import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const TextStyle linhaProdutoNomeDoItem = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle linhaProdutoTotal = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle linhaProdutoPrecoDoItem = TextStyle(
    color: Color(0xFF8E8E93),
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle textoPesquisa = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle textoTempoEntrega = TextStyle(
    color: Color(0xFFC2C2C2),
    fontWeight: FontWeight.w300,
  );

  static const TextStyle tempoEntrega = TextStyle(
    color: CupertinoColors.inactiveGray,
  );

  static const Color linhaProdutoDivisor = Color(0xFFD9D9D9);

  static const Color fundoScaffold = Color(0xfff0f0f0);

  static const Color fundoPesquisa = Color(0xffe0e0e0);

  static const Color cursorPesquisaCor = Color.fromRGBO(0, 122, 255, 1);

  static const Color iconePesquisaCor = Color.fromRGBO(128, 128, 128, 1);
}
