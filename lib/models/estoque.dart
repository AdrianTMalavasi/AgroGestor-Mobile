import 'safra.dart';
import 'dono.dart';

class Estoque {
  Dono dono;
  List<Safra> safras;

  Estoque(this.dono): safras = [];

  int calcularQtdSacasTotal() {
    return safras.fold(0, (total, safra) => total + safra.calcularQtdSacasTotais());
  }

  int calcularQtdSacasRestante() {
    return safras.fold(0, (total, safra) => total + safra.calcularQtdSacasRestantes());
  }

  double calcularDespesaTotal() {
    return safras.fold(0, (total, safra) => total + safra.despesas.fold(0, (s, d) => s + d.valorTotal));
  }

  double calcularVendaTotal() {
    return safras.fold(0, (total, safra) => total + safra.vendas.fold(0, (s, v) => s + v.calcularValorTotal()));
  }

  Safra pesquisarSafra(ano) {
    return safras.firstWhere((safra) => safra.ano == ano);
  }
}

  // int calcularQtdSacasTotal() {
  //   int total = 0;
  //   for (var safra in safras) {
  //     total += safra.calcularQtdSacasTotais();
  //   }
  //   return total;
  // }

  // double calcularDespesaTotal() {
  //   double total = 0;
  //   for (var safra in safras) {
  //     for (var despesa in safra.despesas) {
  //       total += despesa.valorTotal;
  //     }
  //   }
  //   return total;
  // }

  // double calcularVendaTotal() {
  //   double total = 0;
  //   for (var safra in safras) {
  //     for (var venda in safra.vendas) {
  //       total += venda.calcularValorTotal();
  //     }
  //   }
  //   return total;
  // }
