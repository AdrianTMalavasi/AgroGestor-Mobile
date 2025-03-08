import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/default.dart';
import 'components/login.dart';

void main() {
  runApp(AgroGestor());
}

class AgroGestor extends StatelessWidget {
  const AgroGestor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroGestor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(82, 35, 12, 1),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.jockeyOneTextTheme(),
      ),
      home: SafeArea(
        child: PaginaDefault(body: FormLogin(), pagina: 'Login', indice: 1),
      ),
    );
  }
}
