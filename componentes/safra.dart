import 'package:flutter/material.dart';

class SafraComponent extends StatefulWidget {
  @override
  _SafraComponentState createState() => _SafraComponentState();
}

class _SafraComponentState extends State<SafraComponent> {
  String? selectedYear; // Variável para armazenar o ano selecionado
  final List<String> years = ['2025', '2024', '2023', '2022', '2021']; // Lista de anos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AGROGESTOR'),
      ),
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
                'assets/safra_background.jpg',  // Caminho correto para a imagem
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
                    color: Colors.white.withOpacity(0.7), // Fundo branco com opacidade
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    value: selectedYear,
                    hint: Text('Selecione o Ano'),
                    onChanged: (newValue) {
                      setState(() {
                        selectedYear = newValue;
                      });
                    },
                    items: years.map((String year) {
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
