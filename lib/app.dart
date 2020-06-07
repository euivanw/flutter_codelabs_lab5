import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLojaCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Este aplicativo foi desenhado para funcionar na vertical,
    // desta forma, nós podemos limitar a orientação para retrato
    // em pé e deitado.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return CupertinoApp(
      home: PaginaPrincipalLojaCupertino(),
    );
  }
}

class PaginaPrincipalLojaCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Loja Cupertino'),
      ),
      child: SizedBox(),
    );
  }
}
