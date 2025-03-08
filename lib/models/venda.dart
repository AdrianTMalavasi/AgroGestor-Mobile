class Venda {
  String nomeEmpresa;
  DateTime dataVenda;
  int qtdSacas;
  double valorSaca;
  String metodoPagamento;

  Venda({
    required this.nomeEmpresa,
    required this.dataVenda,
    required this.qtdSacas,
    required this.valorSaca,
    required this.metodoPagamento,
  });

  double calcularValorTotal() {
    return qtdSacas * valorSaca;
  }
}
