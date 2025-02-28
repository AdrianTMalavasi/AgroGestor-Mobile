import 'dono.dart';
import 'despesa.dart';
import 'colheita.dart';
import 'venda.dart';

class Safra {
  Dono dono;
  double hectares;
  List<Despesa> despesas;
  List<Colheita> colheitas;
  List<Venda> vendas;

  Safra({required this.dono, required this.hectares})
      : despesas = [], colheitas = [], vendas = [];

  void adicionarDespesa(Despesa despesa) {
    despesas.add(despesa);
  }

  void adicionarColheita(Colheita colheita) {
    colheitas.add(colheita);
  }

  void adicionarVenda(Venda venda) {
    vendas.add(venda);
  }

  int calcularQtdSacasTotais() {
    return colheitas.fold(0, (total, colheita) => total + colheita.qtdSacas);
  }

  int calcularQtdSacasRestantes() {
    int totalColheita = calcularQtdSacasTotais();
    int totalVendido = vendas.fold(0, (total, venda) => total + venda.qtdSacas);
    return totalColheita - totalVendido;
  }
}