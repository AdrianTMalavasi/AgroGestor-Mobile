import 'package:flutter/material.dart';
import './default.dart';
import '../dados.dart';
import '../models/estoque.dart';
import '../models/safra.dart';
import 'listagem_itens.dart';
import 'listagem_estoque.dart';

Estoque estoque = carregarEstoque();

class SelectSafra extends StatefulWidget {
  const SelectSafra({super.key});

  @override
  State<SelectSafra> createState() => SelectSafraState();
}

class SelectSafraState extends State<SelectSafra> {
  String? anoSelecionado; // Variável para armazenar o ano selecionado
  final List<String> years = [
    'Estoque',
    '2025',
    '2024',
    '2023',
    '2022',
    '2021',
  ]; // Lista de anos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Cor de fundo rosa
          Container(
            color: Colors.pink, // Fundo rosa
          ),
          // Imagem de fundo ajustada
          Positioned.fill(
            child: FittedBox(
              fit: BoxFit.cover, // Ajuste da imagem para cobrir a tela
              child: Image.asset(
                'assets/safra_background.jpg', // Caminho correto para a imagem
              ),
            ),
          ),
          // Container com o Dropdown
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Dropdown para selecionar o ano
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white, // Fundo branco com opacidade
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    value: anoSelecionado,
                    hint: Text('Selecione o ano...'),
                    onChanged: (novoAno) async {
                      anoSelecionado = novoAno;
                      if (anoSelecionado == 'Estoque') {
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => PaginaDefault(
                                  body: ListagemEstoque(
                                    estoque: estoque,
                                    secao: 'Produções',
                                  ),
                                  pagina: 'Estoque',
                                  indice: 0,
                                  itens: estoque,
                                ),
                          ),
                          (route) => false,
                        );
                        setState(() {});
                      } else {
                        Safra safra = estoque.pesquisarSafra(anoSelecionado);
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => PaginaDefault(
                                  body: ListagemItens(
                                    safra: safra,
                                    secao: 'Produções',
                                  ),
                                  pagina: 'Produções',
                                  indice: 0,
                                  itens: safra,
                                ),
                          ),
                          (route) => false,
                        );
                        setState(() {});
                      }
                    },
                    items:
                        years.map((String year) {
                          return DropdownMenuItem<String>(
                            value: year,
                            child: Text(year),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
