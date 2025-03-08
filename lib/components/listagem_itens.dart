import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/safra.dart';

class ListagemItens extends StatefulWidget {
  final Safra safra;
  final String secao;

  const ListagemItens({super.key, required this.safra, required this.secao});

  @override
  State<ListagemItens> createState() => _ListagemItensState();
}

class _ListagemItensState extends State<ListagemItens> {
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
        itemCount: buildItemCount(widget.secao),
        itemBuilder: (context, index) {
          return buildList(widget.secao, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: buildBottomNavigationBar(widget.secao),
    );
  }

  buildItemCount(String secao) {
    if (secao == 'Produções') {
      return widget.safra.producoes.length;
    } else if (secao == 'Vendas') {
      return widget.safra.vendas.length;
    } else if (secao == 'Despesas') {
      return widget.safra.despesas.length;
    } else {
      return SizedBox.shrink();
    }
  }

  buildBottomNavigationBar(String secao) {
    if (secao == 'Produções') {
      return ListTile(
        tileColor: Color.fromRGBO(242, 204, 180, 1),
        leading: Text(
          "Qtd total: ${widget.safra.calcularQtdSacasTotais()} sacas",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        trailing: Text(
          "Qtd restante: ${widget.safra.calcularQtdSacasRestantes()} sacas",
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
          "R\$${widget.safra.calcularValorVendaTotal().toStringAsFixed(2)}",
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
          "R\$${widget.safra.calcularValorDespesaTotal().toStringAsFixed(2)}",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  ListTile buildList(String secao, int index) {
    if (secao == 'Produções') {
      return ListTile(
        title: Text("Produção"),
        subtitle: Text(formatter.format(widget.safra.producoes[index].dataProducao)),
        leading: Icon(Icons.yard_outlined),
        trailing: Text(
          "${widget.safra.producoes[index].qtdSacas} sacas",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      );
    } else if (secao == 'Vendas') {
      return ListTile(
        title: Text("Venda para ${widget.safra.vendas[index].nomeEmpresa}"),
        subtitle: Text(
          "${formatter.format(widget.safra.vendas[index].dataVenda)} - ${widget.safra.vendas[index].metodoPagamento}",
        ),
        leading: Icon(Icons.monetization_on_outlined),
        trailing: Column(
          children: [
            Text(
              "${widget.safra.vendas[index].qtdSacas} sacas",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "R\$ ${widget.safra.vendas[index].calcularValorTotal().toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    } else if (secao == 'Despesas') {
      return ListTile(
        title: Text("Compra em ${widget.safra.despesas[index].nomeEmpresa}"),
        subtitle: Text(
          "${formatter.format(widget.safra.despesas[index].dataDespesa)} - ${widget.safra.despesas[index].metodoPagamento}",
        ),
        leading: Icon(Icons.shopping_bag_outlined),
        trailing: Column(
          children: [
            Text(
              widget.safra.despesas[index].descricao,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "R\$ ${widget.safra.despesas[index].valorTotal.toStringAsFixed(2)}",
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
