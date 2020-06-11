import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'linha_item_produto.dart';
import 'modelo/modelo_estado_app.dart';

class ProdutosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModeloEstadoApp>(
      builder: (context, model, child) {
        final produtos = model.obtemProdutos();
        return CustomScrollView(
          semanticChildCount: produtos.length,
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Loja Cupertino'),
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index < produtos.length) {
                    return LinhaItemProduto(
                      indice: index,
                      produto: produtos[index],
                      ultimoItem: index == produtos.length - 1,
                    );
                  }
                  return null;
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
