import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'modelo/modelo_estado_app.dart';

class CarrinhoTab extends StatefulWidget {
  @override
  _CarrinhoTabState createState() {
    return _CarrinhoTabState();
  }
}

class _CarrinhoTabState extends State<CarrinhoTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModeloEstadoApp>(
      builder: (context, model, child) {
        return const CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Carrinho de Compras'),
            ),
          ],
        );
      },
    );
  }
}
