import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/estoque.dart';

class ListagemEstoque extends StatefulWidget {
  final Estoque estoque;
  final String secao;

  const ListagemEstoque({super.key, required this.estoque, required this.secao});

  @override
  State<ListagemEstoque> createState() => _ListagemEstoqueState();
}

class _ListagemEstoqueState extends State<ListagemEstoque> {
  final formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Pesquisar por nome da empresa...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
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

  int buildItemCount(String secao) {
    if (secao == 'Produções') {
      return widget.estoque.safras.fold(0, (total, safra) => total + safra.producoes.length);
    } else if (secao == 'Vendas') {
      return widget.estoque.safras.fold(0, (total, safra) => total + safra.vendas.length);
    } else if (secao == 'Despesas') {
      return widget.estoque.safras.fold(0, (total, safra) => total + safra.despesas.length);
    } else {
      return 0;
    }
  }

  buildBottomNavigationBar(String secao) {
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
    } else {
      return SizedBox.shrink();
    }
  }

  buildList(String secao, int index) {
    if (secao == 'Produções') {
      List producoes = widget.estoque.safras.expand((safra) => safra.producoes).toList();
      return ListTile(
        title: Text("Produção"),
        subtitle: Text(formatter.format(producoes[index].dataProducao)),
        leading: Icon(Icons.yard_outlined),
        trailing: Text(
          "${producoes[index].qtdSacas} sacas",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      );
    } else if (secao == 'Vendas') {
      List vendas = widget.estoque.safras.expand((safra) => safra.vendas).toList();
      return ListTile(
        title: Text("Venda para ${vendas[index].nomeEmpresa}"),
        subtitle: Text(
          "${formatter.format(vendas[index].dataVenda)} - ${vendas[index].metodoPagamento}",
        ),
        leading: Icon(Icons.monetization_on_outlined),
        trailing: Column(
          children: [
            Text(
              "${vendas[index].qtdSacas} sacas",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "R\$ ${vendas[index].calcularValorTotal().toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    } else if (secao == 'Despesas') {
      List despesas = widget.estoque.safras.expand((safra) => safra.despesas).toList();
      return ListTile(
        title: Text("Compra em ${despesas[index].nomeEmpresa}"),
        subtitle: Text(
          "${formatter.format(despesas[index].dataDespesa)} - ${despesas[index].metodoPagamento}",
        ),
        leading: Icon(Icons.shopping_bag_outlined),
        trailing: Column(
          children: [
            Text(
              despesas[index].descricao,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "R\$ ${despesas[index].valorTotal.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    } else {
      return ListTile();
    }
  }
}
