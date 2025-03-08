import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './default.dart';
import './safra.dart';
import '../models/dono.dart';
import '../dados.dart';

Dono dono = carregarEstoque().dono;

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controladorLogin = TextEditingController();
    final TextEditingController controladorSenha = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 204, 180, 1),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Color.fromRGBO(82, 35, 12, 1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'LOGIN',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: SizedBox(
                  height: 51,
                  child: TextField(
                    controller: controladorLogin,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Login',
                      hintText: 'Digite o login...',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  height: 51,
                  child: TextField(
                    controller: controladorSenha,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Senha',
                      hintText: 'Digite a senha...',
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 40),
                    backgroundColor: Color.fromRGBO(242, 204, 180, 1),
                    foregroundColor: Colors.black,
                    textStyle: GoogleFonts.jockeyOne(fontSize: 18),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text('Entrar'),
                  onPressed: () async {
                    if (controladorLogin.text.isEmpty ||
                        controladorSenha.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Preencha todos os dados.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      final String login = controladorLogin.text;
                      final int senha = int.parse(controladorSenha.text);

                      if (login == dono.login && senha == dono.senha) {
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => PaginaDefault(
                                  body: SelectSafra(),
                                  pagina: "Safra",
                                  indice: 1,
                                ),
                          ),
                          (route) => false
                        );
                        setState(() {});
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login ou senha incorretos.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
