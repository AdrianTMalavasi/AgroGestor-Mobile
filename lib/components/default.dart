import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/grafico_estoque.dart';
import 'package:myapp/components/grafico_itens.dart';
import 'package:myapp/components/listagem_estoque.dart';
import 'package:myapp/components/listagem_itens.dart';
import './login.dart';
import './safra.dart';

// ignore: must_be_immutable
class PaginaDefault extends StatefulWidget {
  Widget body;
  final String pagina;
  final int indice;
  final itens;

  PaginaDefault({
    super.key,
    required this.body,
    required this.pagina,
    required this.indice,
    this.itens,
  });

  @override
  State<PaginaDefault> createState() => _PaginaDefaultState();
}

class _PaginaDefaultState extends State<PaginaDefault> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.pagina == 'Login' || widget.pagina == 'Safra') {
      selectedIndex = 1;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(82, 35, 12, 1),
        title: const Text('AGROGESTOR', style: TextStyle(color: Colors.white)),
        actions: _buildActions(widget.pagina),
      ),
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(82, 35, 12, 1),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        selectedFontSize: 15,
        unselectedItemColor: const Color.fromARGB(255, 172, 172, 172),
        unselectedFontSize: 15,
        items: _buildFooter(widget.pagina),
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }

  _buildActions(String pagina) {
    if (pagina != 'Login') {
      return [
        TextButton(
          onPressed: () async {
            await Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder:
                    (context) => PaginaDefault(
                      body: SelectSafra(),
                      pagina: 'Safra',
                      indice: 1,
                    ),
              ),
              (route) => false,
            );
            setState(() {});
          },
          style: TextButton.styleFrom(foregroundColor: Colors.white),
          child: Text(
            'Safras',
            style: GoogleFonts.jockeyOne(fontSize: 18, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () async {
            await Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder:
                    (context) => PaginaDefault(
                      body: FormLogin(),
                      pagina: 'Login',
                      indice: 1,
                    ),
              ),
              (route) => false,
            );
            setState(() {});
          },
          style: TextButton.styleFrom(foregroundColor: Colors.white),
          child: Text(
            'Sair',
            style: GoogleFonts.jockeyOne(fontSize: 18, color: Colors.white),
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () async {
            await Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder:
                    (context) => PaginaDefault(
                      body: FormLogin(),
                      pagina: 'Login',
                      indice: 1,
                    ),
              ),
              (route) => false,
            );
            setState(() {});
          },
          icon: const Icon(Icons.login),
          iconSize: 30,
          color: Colors.white,
        ),
      ];
    }
  }

  _buildFooter(String pagina) {
    if (pagina == 'Login') {
      return <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, size: 30),
          label: 'Login',
        ),
        BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
      ];
    } else if (pagina == 'Safra') {
      return <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.grass, size: 30),
          label: 'Safra',
        ),
        BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
      ];
    } else {
      return <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.yard), label: 'Produções'),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on),
          label: 'Vendas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Despesas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_graph),
          label: 'Gráficos',
        ),
      ];
    }
  }

  void onItemTapped(int index) {
    setState(() {
      if (widget.pagina == 'Login' || widget.pagina == 'Safra') {
        selectedIndex = 1;
      } else {
        selectedIndex = index;
      }

      if (widget.pagina == 'Estoque') {
        if (selectedIndex == 0) {
          widget.body = ListagemEstoque(
            estoque: widget.itens!,
            secao: 'Produções',
          );
        } else if (selectedIndex == 1) {
          widget.body = ListagemEstoque(
            estoque: widget.itens!,
            secao: 'Vendas',
          );
        } else if (selectedIndex == 2) {
          widget.body = ListagemEstoque(
            estoque: widget.itens!,
            secao: 'Despesas',
          );
        } else {
          widget.body = GraficoEstoque(estoque: widget.itens);
        }
      } else {
        if (selectedIndex == 0) {
          widget.body = ListagemItens(safra: widget.itens!, secao: 'Produções');
        } else if (selectedIndex == 1) {
          widget.body = ListagemItens(safra: widget.itens!, secao: 'Vendas');
        } else if (selectedIndex == 2) {
          widget.body = ListagemItens(safra: widget.itens!, secao: 'Despesas');
        } else {
          widget.body = GraficoItens(safra: widget.itens);
        }
      }
    });
  }
}
