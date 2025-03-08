import 'despesa.dart';
import 'producao.dart';
import 'venda.dart';

class Safra {
  double hectares;
  String ano;
  List<Despesa> despesas;
  List<Producao> producoes;
  List<Venda> vendas;

  Safra({required this.hectares, required this.ano})
    : despesas = [],
      producoes = [],
      vendas = [];

  void adicionarDespesa(Despesa despesa) {
    despesas.add(despesa);
  }

  void adicionarProducao(Producao producao) {
    producoes.add(producao);
  }

  void adicionarVenda(Venda venda) {
    vendas.add(venda);
  }

  int calcularQtdSacasTotais() {
    return producoes.fold(0, (total, colheita) => total + colheita.qtdSacas);
  }

  int calcularQtdSacasRestantes() {
    int totalColheita = calcularQtdSacasTotais();
    int totalVendido = vendas.fold(0, (total, venda) => total + venda.qtdSacas);
    return totalColheita - totalVendido;
  }

  double calcularValorVendaTotal() {
    double lucroTotal = 0;
    for (var venda in vendas) {
      lucroTotal += venda.calcularValorTotal();
    }
    return lucroTotal;
  }

  double calcularValorDespesaTotal() {
    double despesaTotal = 0;
    for (var despesa in despesas) {
      despesaTotal += despesa.valorTotal;
    }
    return despesaTotal;
  }

  @override
  String toString() {
    return 'Safra $ano - $hectares hectares';
  }
}
