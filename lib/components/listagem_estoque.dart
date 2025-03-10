import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/estoque.dart';

class ListagemEstoque extends StatefulWidget {
  final Estoque estoque;
  final String secao;

  const ListagemEstoque({
    super.key,
    required this.estoque,
    required this.secao,
  });

  @override
  State<ListagemEstoque> createState() => _ListagemEstoqueState();
}

class _ListagemEstoqueState extends State<ListagemEstoque> {
  final formatter = DateFormat('dd/MM/yyyy');
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void didUpdateWidget(covariant ListagemEstoque oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.secao != widget.secao) {
      _searchController.clear();
      _searchQuery = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            widget.secao == 'Produções'
                ? Size.fromHeight(0)
                : AppBar().preferredSize,
        child:
            widget.secao == 'Produções'
                ? SizedBox.shrink()
                : AppBar(title: buildTitle(widget.secao)),
      ),
      body: ListView.builder(
        itemCount: buildItemCount(widget.secao) + 1,
        itemBuilder: (context, index) {
          if (index < buildItemCount(widget.secao)) {
            return buildList(widget.secao, index);
          } else {
            return SizedBox(height: 80);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: buildBottomNavigationBar(widget.secao),
    );
  }

  buildTitle(String secao) {
    if (secao == 'Produções') {
      return SizedBox.shrink();
    } else {
      return TextField(
        controller: _searchController,
        onChanged: (query) {
          setState(() {
            _searchQuery = query;
          });
        },
        decoration: InputDecoration(
          hintText: 'Pesquisar por nome da empresa...',
          prefixIcon: Icon(Icons.search),
        ),
      );
    }
  }

  buildItemCount(String secao) {
    var items = _filterItems(secao);
    return items.length;
  }

  List<dynamic> _filterItems(String secao) {
    var items = _getItems(secao);

    if (_searchQuery.isEmpty) {
      return items;
    }

    return items.where((item) {
      if (secao == 'Produções') {
        return item.qtdSacas.toString().contains(_searchQuery);
      } else if (secao == 'Vendas') {
        return item.nomeEmpresa.toLowerCase().contains(
          _searchQuery.toLowerCase(),
        );
      } else if (secao == 'Despesas') {
        return item.nomeEmpresa.toLowerCase().contains(
          _searchQuery.toLowerCase(),
        );
      }
      return false;
    }).toList();
  }

  List<dynamic> _getItems(String secao) {
    if (secao == 'Produções') {
      return widget.estoque.safras.expand((safra) => safra.producoes).toList();
    } else if (secao == 'Vendas') {
      return widget.estoque.safras.expand((safra) => safra.vendas).toList();
    } else if (secao == 'Despesas') {
      return widget.estoque.safras.expand((safra) => safra.despesas).toList();
    }
    return [];
  }

  ListTile buildBottomNavigationBar(String secao) {
    if (secao == 'Produções') {
      return ListTile(
        tileColor: Color.fromRGBO(242, 204, 180, 1),
        leading: Text(
          "Qtd total: ${widget.estoque.calcularQtdSacasTotal()} sacas",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        trailing: Text(
          "Qtd restante: ${widget.estoque.calcularQtdSacasRestante()} sacas",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      );
    } else if (secao == 'Vendas') {
      return ListTile(
        tileColor: Color.fromRGBO(242, 204, 180, 1),
        leading: Text(
          "Valor de venda total:",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        trailing: Text(
          "R\$${widget.estoque.calcularVendaTotal().toStringAsFixed(2)}",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      );
    } else if (secao == 'Despesas') {
      return ListTile(
        tileColor: Color.fromRGBO(242, 204, 180, 1),
        leading: Text(
          "Valor de gasto total:",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        trailing: Text(
          "R\$${widget.estoque.calcularDespesaTotal().toStringAsFixed(2)}",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      );
    }
    return ListTile();
  }

  ListTile buildList(String secao, int index) {
    var items = _filterItems(secao);

    if (secao == 'Produções') {
      return ListTile(
        title: Text("Produção"),
        subtitle: Text(formatter.format(items[index].dataProducao)),
        leading: Icon(Icons.yard_outlined),
        trailing: Text(
          "${items[index].qtdSacas} sacas",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      );
    } else if (secao == 'Vendas') {
      return ListTile(
        title: Text("Venda para ${items[index].nomeEmpresa}"),
        subtitle: Text(
          "${formatter.format(items[index].dataVenda)} - ${items[index].metodoPagamento}",
        ),
        leading: Icon(Icons.monetization_on_outlined),
        trailing: Column(
          children: [
            Text(
              "${items[index].qtdSacas} sacas",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "R\$ ${items[index].calcularValorTotal().toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    } else if (secao == 'Despesas') {
      return ListTile(
        title: Text("Compra em ${items[index].nomeEmpresa}"),
        subtitle: Text(
          "${formatter.format(items[index].dataDespesa)} - ${items[index].metodoPagamento}",
        ),
        leading: Icon(Icons.shopping_bag_outlined),
        trailing: Column(
          children: [
            Text(items[index].descricao, style: TextStyle(fontSize: 16)),
            Text(
              "R\$ ${items[index].valorTotal.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    }
    return ListTile();
  }
}
