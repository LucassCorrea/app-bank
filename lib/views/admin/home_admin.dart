import 'package:app_bank/models/utils/routes.dart';
import 'package:app_bank/views/admin/menu_admin.dart';
import 'package:app_bank/views/components/button_appBar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final alturaTela = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom);
    final padding = MediaQuery.of(context).padding;
    final espacamento = EdgeInsets.only(
      top: size.height * .01,
      bottom: size.height * .01,
    );
    final titles = ["CPF", "Senha"];
    final formatterCPF = [
      FilteringTextInputFormatter.digitsOnly,
      CpfInputFormatter(),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: ButtonAppBar(
          onpressed: () => Navigator.pushNamed(context, Routes.HOME),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: padding,
        child: Stack(
          children: [
            Container(
              height: alturaTela,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AutoSizeText(
                    'NewBank',
                    maxLines: 1,
                    minFontSize: 50,
                    maxFontSize: 60,
                    style: TextStyle(
                      fontFamily: 'Moderna',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB938E0),
                    ),
                  ),
                  const AutoSizeText(
                    'Prezado(a) administrador,\npreencha as informações abaixo.',
                    maxLines: 2,
                    minFontSize: 10,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffB938E0),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * .05,
                      bottom: size.height * .05,
                    ),
                    child: SizedBox(
                      height: size.height * .20,
                      width: size.width * .85,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: espacamento,
                            child: SizedBox(
                              height: size.height * .08,
                              child: TextFormField(
                                inputFormatters: index == 0 ? formatterCPF : [],
                                obscureText:
                                    index == 1 ? _passwordVisible : false,
                                decoration: InputDecoration(
                                  labelText: titles[index],
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    icon: Icon(
                                      index == 1
                                          ? _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        padding: const EdgeInsets.all(0),
                        itemCount: titles.length,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .07,
                    width: size.width * .70,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuAdmin(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffB938E0)),
                      child: const AutoSizeText(
                        'Entrar',
                        maxLines: 1,
                        minFontSize: 15,
                        maxFontSize: 20,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * .03,
                      bottom: size.height * .01,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.FORGOT_PASSWORD);
                      },
                      child: const AutoSizeText(
                        'Esqueci minha senha',
                        maxLines: 1,
                        minFontSize: 15,
                        maxFontSize: 20,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color(0xffB938E0),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.REGISTER_ADMIN);
                    },
                    child: const AutoSizeText(
                      'Cadastre-se',
                      maxLines: 1,
                      minFontSize: 15,
                      maxFontSize: 20,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Color(0xffB938E0),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
