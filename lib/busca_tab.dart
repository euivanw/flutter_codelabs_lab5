import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'modelo/modelo_estado_app.dart';
import 'barra_busca.dart';
import 'linha_item_produto.dart';
import 'styles.dart';

class BuscaTab extends StatefulWidget {
  @override
  _BuscaTabState createState() {
    return _BuscaTabState();
  }
}

class _BuscaTabState extends State<BuscaTab> {
  TextEditingController _controller;
  FocusNode _focusNode;
  String _termos = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_aoMudarTexto);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _aoMudarTexto() {
    setState(() {
      _termos = _controller.text;
    });
  }

  Widget _construirCaixaBusca() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BarraBusca(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ModeloEstadoApp>(context);
    final results = model.search(_termos);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Styles.fundoScaffold,
      ),
      child: SafeArea(
        child: Column(
          children: [
            _construirCaixaBusca(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => LinhaItemProduto(
                  indice: index,
                  produto: results[index],
                  ultimoItem: index == results.length - 1,
                ),
                itemCount: results.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
