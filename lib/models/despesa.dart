class Despesa {
  String nomeEmpresa;
  String descricao;
  DateTime dataDespesa;
  double valorTotal;
  String metodoPagamento;

  Despesa({
    required this.nomeEmpresa,
    required this.descricao,
    required this.dataDespesa,
    required this.valorTotal,
    required this.metodoPagamento
  });
}
