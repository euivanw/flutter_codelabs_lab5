import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'busca_tab.dart';
import 'carrinho_tab.dart';
import 'produtos_tab.dart';

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
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Produtos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Busca'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('Carrrinho'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: ProdutosTab(),
                );
              },
            );
            break;
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: BuscaTab(),
                );
              },
            );
            break;
          case 2:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: CarrinhoTab(),
                );
              },
            );
            break;
        }
        return returnValue;
      },
    );
  }
}
