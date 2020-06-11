import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'modelo/modelo_estado_app.dart';

class ProdutosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModeloEstadoApp>(
      builder: (context, model, child) {
        return const CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Loja Cupertino'),
            ),
          ],
        );
      },
    );
  }
}
