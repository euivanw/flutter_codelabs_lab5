import 'package:flutter/foundation.dart';

enum Categoria {
  todos,
  acessorios,
  roupas,
  casa,
}

class Produto {
  const Produto({
    @required this.categoria,
    @required this.codigo,
    @required this.destaque,
    @required this.nome,
    @required this.preco,
  })  : assert(categoria != null),
        assert(codigo != null),
        assert(destaque != null),
        assert(nome != null),
        assert(preco != null);

  final Categoria categoria;
  final int codigo;
  final bool destaque;
  final String nome;
  final int preco;

  String get assetName => '$codigo-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => '$nome (id=$codigo)';
}
