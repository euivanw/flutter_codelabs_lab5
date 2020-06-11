import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'modelo/modelo_estado_app.dart';

void main() {
  return runApp(
    ChangeNotifierProvider<ModeloEstadoApp>(
      create: (_) => ModeloEstadoApp()..carregaProdutos(),
      child: AppLojaCupertino(),
    ),
  );
}
