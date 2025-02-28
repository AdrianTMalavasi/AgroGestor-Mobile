class Venda {
  String nomeEmpresa;
  DateTime data;
  int qtdSacas;
  double valorSaca;

  Venda({required this.nomeEmpresa, required this.data, required this.qtdSacas, required this.valorSaca});

  double calcularValorTotal() {
    return qtdSacas * valorSaca;
  }
}