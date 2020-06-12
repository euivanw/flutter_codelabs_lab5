import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'modelo/modelo_estado_app.dart';
import 'modelo/produto.dart';
import 'styles.dart';

const double _kAlturaSeletorData = 216;

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
        return CustomScrollView(
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Carrinho'),
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 4),
              sliver: SliverList(
                delegate: _construirFormulario(model),
              ),
            )
          ],
        );
      },
    );
  }

  String nome;
  String email;
  String localizacao;
  String pin;
  DateTime dateTime = DateTime.now();
  final _formatoMoeda = NumberFormat.currency(symbol: '\$');

  Widget _construirCampoNome() {
    return CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.person_solid,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: 'Nome',
      onChanged: (novoNome) {
        setState(() {
          nome = novoNome;
        });
      },
    );
  }

  Widget _construirCampoEmail() {
    return const CupertinoTextField(
      prefix: Icon(
        CupertinoIcons.mail_solid,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: 'E-mail',
    );
  }

  Widget _construirCampoLocalizacao() {
    return const CupertinoTextField(
      prefix: Icon(
        CupertinoIcons.location_solid,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: 'Localização',
    );
  }

  Widget _construirSeletorData(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                Icon(
                  CupertinoIcons.clock,
                  color: CupertinoColors.lightBackgroundGray,
                  size: 28,
                ),
                SizedBox(width: 6),
                Text(
                  'Data de entrega',
                  style: Styles.textoTempoEntrega,
                ),
              ],
            ),
            Text(
              DateFormat.yMMMd().add_jm().format(dateTime),
              style: Styles.tempoEntrega,
            ),
          ],
        ),
        Container(
          height: _kAlturaSeletorData,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            initialDateTime: dateTime,
            onDateTimeChanged: (novaDataEntrega) {
              setState(() {
                dateTime = novaDataEntrega;
              });
            },
          ),
        ),
      ],
    );
  }

  SliverChildBuilderDelegate _construirFormulario(ModeloEstadoApp modelo) {
    return SliverChildBuilderDelegate((context, index) {
      final indiceProduto = index - 4;
      switch (index) {
        case 0:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _construirCampoNome(),
          );
        case 1:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _construirCampoEmail(),
          );
        case 2:
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _construirCampoLocalizacao(),
          );
        case 3:
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: _construirSeletorData(context),
          );
        default:
          if (modelo.produtosNoCarrinho.length > indiceProduto) {
            return ItemCarrinho(
              indice: index,
              produto: modelo.obtemProdutoPorCodigo(modelo.produtosNoCarrinho.keys.toList()[indiceProduto]),
              quantidade: modelo.produtosNoCarrinho.values.toList()[indiceProduto],
              ultimoItem: indiceProduto == modelo.produtosNoCarrinho.length - 1,
              formatador: _formatoMoeda,
            );
          } else if (modelo.produtosNoCarrinho.keys.length == indiceProduto && modelo.produtosNoCarrinho.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Entrega '
                        '${_formatoMoeda.format(modelo.custoDeEntrega)}',
                        style: Styles.linhaProdutoPrecoDoItem,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Imposto ${_formatoMoeda.format(modelo.imposto)}',
                        style: Styles.linhaProdutoPrecoDoItem,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Total  ${_formatoMoeda.format(modelo.totalCost)}',
                        style: Styles.linhaProdutoTotal,
                      ),
                    ],
                  )
                ],
              ),
            );
          }
      }
      return null;
    });
  }
}

class ItemCarrinho extends StatelessWidget {
  const ItemCarrinho({
    @required this.indice,
    @required this.produto,
    @required this.ultimoItem,
    @required this.quantidade,
    @required this.formatador,
  });

  final Produto produto;
  final int indice;
  final bool ultimoItem;
  final int quantidade;
  final NumberFormat formatador;

  @override
  Widget build(BuildContext context) {
    final row = SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(
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
                width: 40,
                height: 40,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          produto.nome,
                          style: Styles.linhaProdutoNomeDoItem,
                        ),
                        Text(
                          '${formatador.format(quantidade * produto.preco)}',
                          style: Styles.linhaProdutoNomeDoItem,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${quantidade > 1 ? '$quantidade x ' : ''}'
                      '${formatador.format(produto.preco)}',
                      style: Styles.linhaProdutoPrecoDoItem,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return row;
  }
}
