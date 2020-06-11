import 'package:flutter/foundation.dart' as foundation;

import 'produto.dart';
import 'produto_repositorio.dart';

double _percentualImposto = 0.06;
double _custoEntregaPorItem = 7;

class ModeloEstadoApp extends foundation.ChangeNotifier {
  // Todos os produtos disponíveis.
  List<Produto> _produtosDisponiveis;

  // A categoria de produtos selecionada atualmente.
  Categoria _categoriaSelecionada = Categoria.todos;

  // Os códigos e quantidades de produtos no carrinho.
  final _produtosNoCarrinho = <int, int>{};

  Map<int, int> get produtosNoCarrinho {
    return Map.from(_produtosNoCarrinho);
  }

  // O número total de itens no carrinho.
  int get totalProdutosCarrinho {
    return _produtosNoCarrinho.values.fold(0, (acumulador, valor) {
      return acumulador + valor;
    });
  }

  Categoria get categoriaSelecionada {
    return _categoriaSelecionada;
  }

  // Valor total dos produtos no carrinho.
  double get subtotalDeCusto {
    return _produtosNoCarrinho.keys.map((codigo) {
      return obtemProdutoPorCodigo(codigo).preco * _produtosNoCarrinho[codigo];
    }).fold(0, (acumulador, preco) {
      return acumulador + preco;
    });
  }

  // Custo total de entrega.
  double get custoDeEntrega {
    return _custoEntregaPorItem *
        _produtosNoCarrinho.values.fold(0.0, (acumulador, contagem) {
          return acumulador + contagem;
        });
  }

  // Impostos
  double get imposto {
    return subtotalDeCusto * _percentualImposto;
  }

  // Custo total da compra.
  double get totalCost {
    return subtotalDeCusto + custoDeEntrega + imposto;
  }

  // Retorna uma cópia da lista de produtos disponível, filtrada por categoria.
  List<Produto> obtemProdutos() {
    if (_produtosDisponiveis == null) {
      return [];
    }

    if (_categoriaSelecionada == Categoria.todos) {
      return List.from(_produtosDisponiveis);
    } else {
      return _produtosDisponiveis.where((produto) {
        return produto.categoria == _categoriaSelecionada;
      }).toList();
    }
  }

  // Busca produtos no catálogo.
  List<Produto> search(String termosDeBusca) {
    return obtemProdutos().where((product) {
      return product.nome.toLowerCase().contains(termosDeBusca.toLowerCase());
    }).toList();
  }

  // Adiciona um produto no carrinho.
  void adicionaProdutoCarrinho(int codigoProduto) {
    if (!_produtosNoCarrinho.containsKey(codigoProduto)) {
      _produtosNoCarrinho[codigoProduto] = 1;
    } else {
      _produtosNoCarrinho[codigoProduto]++;
    }

    notifyListeners();
  }

  // Remove um produto do carrinho.
  void removeProdutoCarrinho(int codigoProduto) {
    if (_produtosNoCarrinho.containsKey(codigoProduto)) {
      if (_produtosNoCarrinho[codigoProduto] == 1) {
        _produtosNoCarrinho.remove(codigoProduto);
      } else {
        _produtosNoCarrinho[codigoProduto]--;
      }
    }

    notifyListeners();
  }

  // Retorna o produto por meio do código.
  Produto obtemProdutoPorCodigo(int codigo) {
    return _produtosDisponiveis.firstWhere((p) => p.codigo == codigo);
  }

  // Limpa o carrinho.
  void limpaCarrinho() {
    _produtosNoCarrinho.clear();
    notifyListeners();
  }

  // Carrega a lista de produtos do repositório.
  void carregaProdutos() {
    _produtosDisponiveis = ProdutoRepositorio.carregaProdutos(Categoria.todos);
    notifyListeners();
  }

  void selecionaCategoria(Categoria novaCategoria) {
    _categoriaSelecionada = novaCategoria;
    notifyListeners();
  }
}
