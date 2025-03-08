import 'models/despesa.dart';
import 'models/dono.dart';
import 'models/estoque.dart';
import 'models/producao.dart';
import 'models/safra.dart';
import 'models/venda.dart';

Estoque carregarEstoque() {
  Dono dono = Dono(nome: "João Vitor", login: "admin", senha: 1234);
  Estoque estoque = Estoque(dono);

  // Criando safra 2025
  Safra safra2025 = Safra(hectares: 50.0, ano: "2025");
  safra2025.adicionarDespesa(
    Despesa(
      nomeEmpresa: "AgroFert",
      descricao: "Compra de fertilizantes",
      dataDespesa: DateTime(2025, 3, 10),
      valorTotal: 5200.0,
      metodoPagamento: "Cartão",
    ),
  );
  safra2025.adicionarDespesa(
    Despesa(
      nomeEmpresa: "Rural Equip",
      descricao: "Manutenção de equipamentos",
      dataDespesa: DateTime(2025, 4, 5),
      valorTotal: 3000.0,
      metodoPagamento: "Transferência",
    ),
  );
  safra2025.adicionarProducao(
    Producao(dataProducao: DateTime(2025, 6, 15), qtdSacas: 120),
  );
  safra2025.adicionarProducao(
    Producao(dataProducao: DateTime(2025, 7, 10), qtdSacas: 80),
  );
  safra2025.adicionarVenda(
    Venda(
      nomeEmpresa: "Café Brasil",
      dataVenda: DateTime(2025, 8, 5),
      qtdSacas: 90,
      valorSaca: 580.0,
      metodoPagamento: "Boleto",
    ),
  );
  safra2025.adicionarVenda(
    Venda(
      nomeEmpresa: "Exportadora Premium",
      dataVenda: DateTime(2025, 9, 20),
      qtdSacas: 70,
      valorSaca: 600.0,
      metodoPagamento: "Pix",
    ),
  );
  estoque.safras.add(safra2025);

  // Criando safra 2024
  Safra safra2024 = Safra(hectares: 48.0, ano: "2024");
  safra2024.adicionarDespesa(
    Despesa(
      nomeEmpresa: "AgroTech",
      descricao: "Defensivos agrícolas",
      dataDespesa: DateTime(2024, 2, 20),
      valorTotal: 4700.0,
      metodoPagamento: "Transferência",
    ),
  );
  safra2024.adicionarDespesa(
    Despesa(
      nomeEmpresa: "Máquinas Rurais",
      descricao: "Peças de reposição",
      dataDespesa: DateTime(2024, 3, 15),
      valorTotal: 2500.0,
      metodoPagamento: "Cartão",
    ),
  );
  safra2024.adicionarProducao(
    Producao(dataProducao: DateTime(2024, 6, 18), qtdSacas: 110),
  );
  safra2024.adicionarProducao(
    Producao(dataProducao: DateTime(2024, 7, 25), qtdSacas: 90),
  );
  safra2024.adicionarVenda(
    Venda(
      nomeEmpresa: "Exportadora Café",
      dataVenda: DateTime(2024, 9, 10),
      qtdSacas: 85,
      valorSaca: 590.0,
      metodoPagamento: "Pix",
    ),
  );
  safra2024.adicionarVenda(
    Venda(
      nomeEmpresa: "Mercado do Café",
      dataVenda: DateTime(2024, 10, 5),
      qtdSacas: 80,
      valorSaca: 620.0,
      metodoPagamento: "Transferência",
    ),
  );
  estoque.safras.add(safra2024);

  // Criando safra 2023
  Safra safra2023 = Safra(hectares: 46.0, ano: "2023");
  safra2023.adicionarDespesa(
    Despesa(
      nomeEmpresa: "PlantAgro",
      descricao: "Irrigação automatizada",
      dataDespesa: DateTime(2023, 3, 5),
      valorTotal: 5100.0,
      metodoPagamento: "Boleto",
    ),
  );
  safra2023.adicionarDespesa(
    Despesa(
      nomeEmpresa: "Sementes Ouro",
      descricao: "Novas variedades de café",
      dataDespesa: DateTime(2023, 4, 12),
      valorTotal: 3200.0,
      metodoPagamento: "Cartão",
    ),
  );
  safra2023.adicionarProducao(
    Producao(dataProducao: DateTime(2023, 6, 22), qtdSacas: 130),
  );
  safra2023.adicionarProducao(
    Producao(dataProducao: DateTime(2023, 7, 30), qtdSacas: 75),
  );
  safra2023.adicionarVenda(
    Venda(
      nomeEmpresa: "Café Supremo",
      dataVenda: DateTime(2023, 8, 15),
      qtdSacas: 95,
      valorSaca: 560.0,
      metodoPagamento: "Pix",
    ),
  );
  safra2023.adicionarVenda(
    Venda(
      nomeEmpresa: "Torrefação Elite",
      dataVenda: DateTime(2023, 9, 25),
      qtdSacas: 85,
      valorSaca: 580.0,
      metodoPagamento: "Transferência",
    ),
  );
  estoque.safras.add(safra2023);

  // Criando safra 2022
  Safra safra2022 = Safra(hectares: 44.0, ano: "2022");
  safra2022.adicionarDespesa(
    Despesa(
      nomeEmpresa: "AgroSol",
      descricao: "Tratamento do solo",
      dataDespesa: DateTime(2022, 2, 10),
      valorTotal: 4300.0,
      metodoPagamento: "Boleto",
    ),
  );
  safra2022.adicionarDespesa(
    Despesa(
      nomeEmpresa: "EquipCafé",
      descricao: "Peças para colheitadeira",
      dataDespesa: DateTime(2022, 4, 5),
      valorTotal: 2800.0,
      metodoPagamento: "Pix",
    ),
  );
  safra2022.adicionarProducao(
    Producao(dataProducao: DateTime(2022, 6, 12), qtdSacas: 115),
  );
  safra2022.adicionarProducao(
    Producao(dataProducao: DateTime(2022, 7, 22), qtdSacas: 85),
  );
  safra2022.adicionarVenda(
    Venda(
      nomeEmpresa: "Café Premium",
      dataVenda: DateTime(2022, 8, 30),
      qtdSacas: 90,
      valorSaca: 540.0,
      metodoPagamento: "Cartão",
    ),
  );
  safra2022.adicionarVenda(
    Venda(
      nomeEmpresa: "Exportadora Select",
      dataVenda: DateTime(2022, 9, 18),
      qtdSacas: 80,
      valorSaca: 550.0,
      metodoPagamento: "Transferência",
    ),
  );
  estoque.safras.add(safra2022);

  // Criando safra 2021
  Safra safra2021 = Safra(hectares: 42.0, ano: "2021");
  safra2021.adicionarDespesa(
    Despesa(
      nomeEmpresa: "AgroFazenda",
      descricao: "Compra de adubos",
      dataDespesa: DateTime(2021, 3, 15),
      valorTotal: 3900.0,
      metodoPagamento: "Cartão",
    ),
  );
  safra2021.adicionarDespesa(
    Despesa(
      nomeEmpresa: "RuralMáquinas",
      descricao: "Reparos em equipamentos",
      dataDespesa: DateTime(2021, 4, 8),
      valorTotal: 2600.0,
      metodoPagamento: "Boleto",
    ),
  );
  safra2021.adicionarProducao(
    Producao(dataProducao: DateTime(2021, 6, 10), qtdSacas: 105),
  );
  safra2021.adicionarProducao(
    Producao(dataProducao: DateTime(2021, 7, 15), qtdSacas: 95),
  );
  safra2021.adicionarVenda(
    Venda(
      nomeEmpresa: "Café do Brasil",
      dataVenda: DateTime(2021, 8, 20),
      qtdSacas: 85,
      valorSaca: 530.0,
      metodoPagamento: "Pix",
    ),
  );
  safra2021.adicionarVenda(
    Venda(
      nomeEmpresa: "Exportadora Global",
      dataVenda: DateTime(2021, 9, 10),
      qtdSacas: 75,
      valorSaca: 545.0,
      metodoPagamento: "Transferência",
    ),
  );
  estoque.safras.add(safra2021);

  return estoque;
}
