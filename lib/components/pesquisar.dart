import 'package:flutter/material.dart';

class PesquisaEmpresa extends StatefulWidget {
  final List<dynamic> itens;
  final Function(List<dynamic>) onFiltrar;

  const PesquisaEmpresa({
    super.key,
    required this.itens,
    required this.onFiltrar,
  });

  @override
  State<PesquisaEmpresa> createState() => _PesquisaEmpresaState();
}

class _PesquisaEmpresaState extends State<PesquisaEmpresa> {
  final TextEditingController _controller = TextEditingController();

  void _filtrarItens(String query) {
    if (query.isEmpty) {
      widget.onFiltrar(widget.itens);
      return;
    }

    final listaFiltrada = widget.itens
        .where((item) => item.nomeEmpresa.toLowerCase().contains(query.toLowerCase()))
        .toList();

    widget.onFiltrar(listaFiltrada);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Pesquisar por nome da empresa...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: _filtrarItens,
      ),
    );
  }
}
