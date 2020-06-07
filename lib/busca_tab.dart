import 'package:flutter/cupertino.dart';

class BuscaTab extends StatefulWidget {
  @override
  _BuscaTabState createState() {
    return _BuscaTabState();
  }
}

class _BuscaTabState extends State<BuscaTab> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Busca'),
        ),
      ],
    );
  }
}
