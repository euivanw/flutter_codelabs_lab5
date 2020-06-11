import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'modelo/modelo_estado_app.dart';
import 'modelo/produto.dart';
import 'styles.dart';

class LinhaItemProduto extends StatelessWidget {
  const LinhaItemProduto({
    this.indice,
    this.produto,
    this.ultimoItem,
  });

  final Produto produto;
  final int indice;
  final bool ultimoItem;

  @override
  Widget build(BuildContext context) {
    final row = SafeArea(
      top: false,
      bottom: false,
      minimum: const EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 8,
        right: 8,
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              produto.assetName,
              package: produto.assetPackage,
              fit: BoxFit.cover,
              width: 76,
              height: 76,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    produto.nome,
                    style: Styles.linhaProdutoNomeDoItem,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  Text(
                    '\$${produto.preco}',
                    style: Styles.linhaProdutoPrecoDoItem,
                  )
                ],
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              final model = Provider.of<ModeloEstadoApp>(context, listen: false);
              model.adicionaProdutoCarrinho(produto.codigo);
            },
            child: const Icon(
              CupertinoIcons.plus_circled,
              semanticLabel: 'Adicionar',
            ),
          ),
        ],
      ),
    );

    if (ultimoItem) {
      return row;
    }

    return Column(
      children: <Widget>[
        row,
        Padding(
          padding: const EdgeInsets.only(
            left: 100,
            right: 16,
          ),
          child: Container(
            height: 1,
            color: Styles.linhaProdutoDivisor,
          ),
        ),
      ],
    );
  }
}
