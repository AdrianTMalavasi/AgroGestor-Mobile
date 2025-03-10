import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:myapp/models/estoque.dart';

// ignore: must_be_immutable
class GraficoEstoque extends StatefulWidget {
  Estoque estoque;
  GraficoEstoque({super.key, required this.estoque});

  @override
  State<GraficoEstoque> createState() => _GraficoEstoqueState();
}

class _GraficoEstoqueState extends State<GraficoEstoque> {
  @override
  Widget build(BuildContext context) {
    double valorDespesa = widget.estoque.calcularDespesaTotal();
    double valorVenda = widget.estoque.calcularVendaTotal();
    double valorTotal = valorDespesa + valorVenda;
    double porcentagemDespesa = (valorDespesa / valorTotal) * 100;
    double porcentagemLucro = (valorVenda / valorTotal) * 100;

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 0, // Espaço central para melhorar visualização
              sections: <PieChartSectionData>[
                PieChartSectionData(
                  value: valorDespesa,
                  color: Colors.red,
                  title: '${porcentagemDespesa.toStringAsFixed(2)}%',
                  radius: 150,
                  titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                  titlePositionPercentageOffset: 0.6
                ),
                PieChartSectionData(
                  value: valorVenda,
                  color: Colors.green,
                  title: '${porcentagemLucro.toStringAsFixed(2)}%',
                  radius: 150,
                  titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                  titlePositionPercentageOffset: 0.6
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildItemLegenda(Colors.red, "Despesas"),
            const SizedBox(width: 16),
            buildItemLegenda(Colors.green, "Vendas"),
          ],
        ),
      ],
    );
  }

  Widget buildItemLegenda(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
